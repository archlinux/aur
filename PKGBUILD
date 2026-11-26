# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=terralist-bin
pkgver=0.11.4
pkgrel=1
pkgdesc="Private Terraform registry for modules and providers"
arch=('x86_64' 'aarch64')
url="https://github.com/terralist/terralist"
license=('MPL-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/terralist/terralist/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/terralist_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/terralist_linux_arm64.zip")
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
sha256sums_x86_64=('dcf14ae57477ff5f02dec2f68f10c5414c8c21815095c1fc4c1968daa14ef9d0')
sha256sums_aarch64=('bbb2a3d3ad3cfac9ab012b855ea2f5f1eadddcfa2b4849ba457bcd8465bf0b1a')

package() {
  install -Dm755 "terralist" "${pkgdir}/usr/bin/terralist"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
