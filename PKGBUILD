# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=reminal-bin
pkgver=3.22.25
pkgrel=1
pkgdesc="Access the windows, desktops and terminals of your machines from any browser"
arch=('x86_64' 'aarch64')
url="https://github.com/harshalgajjar/Reminal"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/harshalgajjar/Reminal/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/reminal_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/reminal_${pkgver}_linux_arm64.tar.gz")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('719d1abc8ca6632dbd1b7baa726bff3127c56d8c1b4f10c19dae8b3ab2e3453c')
sha256sums_aarch64=('780c4725696cb971b1fd7932c790e9ccc50c28e68e87f98c41a2acc5b45672c8')

package() {
  install -Dm755 "reminal" "${pkgdir}/usr/bin/reminal"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
