# Maintainer: Jozef Riha <jose1711@gmail.com>
# Contributor: Avi H.D. <strykar@hotmail.com>

pkgname=tcpconsole
arch=('i686' 'x86_64')
pkgver=1.0
pkgrel=1
license=('GPL')
pkgdesc="A emergency network console for Linux which uses low-level Linux system calls"
url="https://github.com/folkertvanheusden/tcpconsole"
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/folkertvanheusden/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('279fdb783e109ea9bff586ab084e3539736e77f9f21cb4f1e3b63c4542f87221')
install=${pkgname}.install

build() {
cd "${srcdir}"/"${pkgname}"-"${pkgver}"
make
}

package() {
install -Dm 755 "${srcdir}"/"${pkgname}"-"${pkgver}"/tcpconsole "${pkgdir}"/usr/bin/tcpconsole
}
