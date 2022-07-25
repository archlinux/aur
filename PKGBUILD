# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=pies
pkgver=1.7
pkgrel=1
pkgdesc="Program Invocation and Execution Supervisor"
url="https://www.gnu.org/software/pies"
arch=('x86_64')
license=("GPL3")
depends=("gcc-libs")
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/pies/${pkgname}-${pkgver}.tar.gz")
md5sums=('50d96aaad4ab44e7b9424f1ba371d949')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix "${pkgdir}/usr" --sbindir "${pkgdir}/usr/bin" --localstatedir "${pkgdir}/var"
  make
 
}

package() {
  cd "$pkgname-$pkgver"

  make install

}
