# Maintainer: spider-mario <spidermario@free.fr>
pkgname=vocoder-ladspa
pkgver=0.4
pkgrel=1
pkgdesc="Vocoder LADSPA plugin"
arch=('i686' 'x86_64')
url="http://www.sirlab.de/linux/download_vocoder_ladspa.html"
license=('GPL')
groups=('multimedia')
depends=('glibc')
makedepends=('ladspa')
source=(http://www.sirlab.de/linux/download/$pkgname-$pkgver.tgz)
md5sums=('c9a2a36666b8c22284ef1f5f1d24ced3')

build() {
  cd "$srcdir/vocoder-$pkgver"
  make
}

package() {
  cd "$srcdir/vocoder-$pkgver"
  install -Dm644 vocoder.so "$pkgdir"/usr/lib/ladspa/vocoder.so
}

# vim:set ts=2 sw=2 et:
