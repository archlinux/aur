# Maintainer: Davide Carnemolla <herbrant@protonmail.com>
pkgname=codexbar-cli
pkgver=0.27.0
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
sha256sums_x86_64=('9963f4c09d37b783f976f4f5fecb3063589d1952911bc044f27841798ef5e055')
sha256sums_aarch64=('ea7ab45f93d6196dd058f31d619af1864ac91f311b43e2e7fc85c4c9eb641187')

package() {
    patchelf --replace-needed libxml2.so.2 libxml2.so.16 CodexBarCLI
    install -Dm755 CodexBarCLI "${pkgdir}/usr/bin/codexbar"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
