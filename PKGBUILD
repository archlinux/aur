# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=pies
pkgver=1.8
pkgrel=1
pkgdesc="Program Invocation and Execution Supervisor"
url="https://www.gnu.org/software/pies"
arch=('x86_64')
license=("GPL3")
depends=("gcc-libs")
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/pies/${pkgname}-${pkgver}.tar.gz")
md5sums=('8351aed26771d86d4a56a4093afb5d88')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix "${pkgdir}/usr" --sbindir "${pkgdir}/usr/bin" --localstatedir "${pkgdir}/var"
  make
 
}

package() {
  cd "$pkgname-$pkgver"

  make install

}
