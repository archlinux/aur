# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tfui-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Interactive TUI for Terraform workflows"
arch=('x86_64' 'aarch64')
url="https://github.com/SayYoungMan/tfui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tfui_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tfui_linux_arm64.tar.gz")
sha256sums_x86_64=('3aef74ac63586ac476d165af041c7b4e4679ab9559e6fb3d87195dcc434d0890')
sha256sums_aarch64=('5e83aa40302a399f7bcf72f1fe84a91ea319f0a8493e3699d6d77dabb1e96c28')

package() {
  install -Dm755 "tfui" "${pkgdir}/usr/bin/tfui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
