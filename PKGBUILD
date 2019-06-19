# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=cppi
pkgver=1.18
pkgrel=1
pkgdesc="GNU Cppi indents C preprocessor directives to reflect their nesting, among other regularizations."
arch=(any)
url="https://www.gnu.org/software/cppi/"
license=('GPL3')
depends=('gawk')
source=("https://ftp.gnu.org/gnu/cppi/cppi-${pkgver}.tar.xz")
md5sums=('720f4e442287283a02979ba43a44366e')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
