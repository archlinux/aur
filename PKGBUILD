# Maintainer: Coraline Shuryn <coraline.shuryn@gmail.com>
pkgname=antigravity-cli
pkgver=1.1.19_4894004681244672
pkgrel=1
pkgdesc="Google's agentic development platform (CLI companion)"
arch=('x86_64' 'aarch64')
url="https://antigravity.google/product/antigravity-cli"
license=('custom:proprietary')
provides=('agy')
conflicts=('agy')
depends=('glibc')
optdepends=('antigravity: to authenticate and share session state from the desktop application')
options=('!strip')
install=antigravity-cli.install

source=("LICENSE")
sha256sums=('7bcdb3cf53451b33c75e04f1f0e623e8aa8b7943a72f54f4781a7ad545a7d1ce')
sha256sums_x86_64=('a02132a7c6c647ef0ad483ecbe767619adf6b660a5589cba5c937b0c83909b97')
sha256sums_aarch64=('15bd9959ec0c08bcbfee94b376f02bd8b552dcf17a539bcd210a443fb82443cb')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-cli/${pkgver//_/-}/linux-x64/cli_linux_x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-cli/${pkgver//_/-}/linux-arm/cli_linux_arm64.tar.gz")


package() {
    install -Dm755 "${srcdir}/antigravity" "${pkgdir}/usr/bin/agy"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
