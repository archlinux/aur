# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=zita-bls1
pkgver=0.1.0
pkgrel=1
pkgdesc="Implementation of a Blumlein Shuffler to convert binaural stereo signals into a form suitable for reproduction on convential stereo speakers."
arch=(i686 x86_64)
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL')
depends=('cairo' 'clthreads>=2.4.0' 'clxclient>=3.9' 'jack' 'zita-convolver')
source=("${url}downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('779607b49f7d82e52af4461403f6576d')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"

  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver/source"

  make PREFIX=/usr DESTDIR="$pkgdir" install

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 ../doc/html/* "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
