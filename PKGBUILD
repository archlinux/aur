# Maintainer: Marcin Szleper <marcin.szleper@gmail.com>

pkgname=msi-keyboard-light
pkgver=0.1.0
pkgrel=1
pkgdesc="Tool for msi keyboard backlight administration"
arch=('x86_64')
url="https://github.com/szlepermarcin/${pkgname}"
license=('MIT')
makedepends=('stack')
depends=('libusb')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1020bdba89f4114deeed52333da698a76634802e606107a2d7159d9e869f913e')


build() {
  cd "${pkgname}-${pkgver}"
  stack build
}

package() {
  cd "${pkgname}-${pkgver}"
  stack --local-bin-path "${pkgdir}/usr/bin/" install "${pkgname}:exe:${pkgname}"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
