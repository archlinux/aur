# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ssosync-bin
pkgver=2.12.2
pkgrel=1
pkgdesc="Sync Google Workspace users and groups into AWS SSO"
arch=('x86_64' 'aarch64')
url="https://github.com/awslabs/ssosync"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ssosync_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ssosync_Linux_arm64.tar.gz")
sha256sums_x86_64=('82970b77e0b404f67ca6f3f4158ec60a7224234f0785abd5dbd335b6e2e7219c')
sha256sums_aarch64=('043d7780f9ebc1f8dbff45e6cbd9f889ed622f01d415e3efae6402de4f40e3c6')

package() {
  install -Dm755 "ssosync" "${pkgdir}/usr/bin/ssosync"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
