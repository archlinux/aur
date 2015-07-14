# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgname=rude
pkgver=0.70
pkgrel=1
pkgdesc='Real-time UDP Data Emitter'
url='http://rude.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL')
source=("http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('04f3206da3aada5aba04cc0ffe0113b4')

build() {
  cd "${srcdir}/${pkgname}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "$pkgdir"/usr/share/man/man8
  install -dm755 "$pkgdir"/usr/bin
  install -m755 rude/rude "$pkgdir"/usr/bin
  install -m755 crude/crude "$pkgdir"/usr/bin
  install -m644 rude/rude.8 "$pkgdir"/usr/share/man/man8
  install -m644 crude/crude.8 "$pkgdir"/usr/share/man/man8
}

# vim:set ts=2 sw=2 et:
