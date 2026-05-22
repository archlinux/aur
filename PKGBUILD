# Maintainer: Coraline Shuryn <coraline.shuryn@gmail.com>
pkgname=antigravity-cli
pkgver=1.0.1_5826024320139264
pkgrel=1
pkgdesc="Google's agentic development platform (CLI companion)"
arch=('x86_64' 'aarch64')
url="https://antigravity.google/"
license=('custom:proprietary')
provides=('agy')
conflicts=('agy')
depends=('glibc')
optdepends=('antigravity: to authenticate and share session state from the desktop application')
options=('!strip')
install=antigravity-cli.install

source=("LICENSE")
sha256sums=('7bcdb3cf53451b33c75e04f1f0e623e8aa8b7943a72f54f4781a7ad545a7d1ce')
sha256sums_x86_64=('81fa03ef9d8576d08b4cc0048ddbed29d3d46a7801f8b443a935471dd9c06dbe')
sha256sums_aarch64=('c6c306cb4c273455dd0b92c29e791499ff937f6c9d0a22e1ef81c971e5bcf51a')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-cli/${pkgver//_/-}/linux-x64/cli_linux_x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-cli/${pkgver//_/-}/linux-arm/cli_linux_arm64.tar.gz")


package() {
    install -Dm755 "${srcdir}/antigravity" "${pkgdir}/usr/bin/agy"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
