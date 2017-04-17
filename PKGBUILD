# Maintainer: John Hawthorn (john.hawthorn@gmail.com)
pkgname=fzy
pkgver=0.9
pkgrel=1
pkgdesc="A better fuzzy finder"
url="https://github.com/jhawthorn/fzy"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=()

source=(https://github.com/jhawthorn/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('4cfd8a005aef05ccd6d83798555c05b2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
