# Maintainer: John Hawthorn (john.hawthorn@gmail.com)
pkgname=fzy
pkgver=0.7
pkgrel=1
pkgdesc="A better fuzzy finder"
url="https://github.com/jhawthorn/fzy"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=()

source=(https://github.com/jhawthorn/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('cac3f8c4b6b8b26d2f5fa48435fae3a0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
