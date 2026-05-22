# Maintainer: Davide Carnemolla <herbrant@protonmail.com>
pkgname=codexbar-cli
pkgver=0.29.0
pkgrel=1
pkgdesc='AI coding provider usage tracker CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/steipete/CodexBar'
license=('MIT')
depends=('libxml2')
makedepends=('patchelf')
provides=('codexbar')
conflicts=('codexbar')

source=("LICENSE::https://raw.githubusercontent.com/steipete/CodexBar/v${pkgver}/LICENSE")
source_x86_64=("CodexBarCLI-v${pkgver}-linux-x86_64.tar.gz::https://github.com/steipete/CodexBar/releases/download/v${pkgver}/CodexBarCLI-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("CodexBarCLI-v${pkgver}-linux-aarch64.tar.gz::https://github.com/steipete/CodexBar/releases/download/v${pkgver}/CodexBarCLI-v${pkgver}-linux-aarch64.tar.gz")
sha256sums=('14293556b79940745123d0160c71d27ed0e9fe9b8a848093f3ed78f4853caafe')
sha256sums_x86_64=('6e2eb5d1a18ab4637ff818aa0f4e1857eb983f91224c0fc25ef4298bb281ddb6')
sha256sums_aarch64=('0e839a3e34240872b391163e512062e696d2d9e9e668ff1ad9ba6d1e4a37803f')

package() {
    patchelf --replace-needed libxml2.so.2 libxml2.so.16 CodexBarCLI
    install -Dm755 CodexBarCLI "${pkgdir}/usr/bin/codexbar"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
