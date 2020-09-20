# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=xboot
pkgver=2.0.1
pkgrel=1
pkgdesc="The extensible bootloader for embedded system with application engine, write once, run everywhere.Linux Sandbox for x86_64"
arch=('x86_64')
url="https://github.com/xboot/xboot"
license=('MIT')
depends=('sdl2')
provides=("${pkgname}-sandbox")
conflicts=("${pkgname}-sandbox")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/xboot/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('13d32fa8c199ff8f2755543996f6c74ab7f00909834090a01b39f706ce10b799')

build() {
  cd ${pkgname}-${pkgver}

  make CROSS_COMPILE="" PLATFORM=x64-sandbox
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm755 output/${pkgname}  ${pkgdir}/usr/bin/${pkgname}
}

# vim: set sw=2 ts=2 et:
