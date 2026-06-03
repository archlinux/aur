# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=quarto-cli-bin-pre-release
pkgver="1.10.8"
pkgrel=1
pkgdesc="An open-source scientific and technical publishing system built on Pandoc  (pre-release binary from official repo)"
arch=('x86_64' 'aarch64')
license=('GPL')
url="http://quarto.org/"
depends=('bash')
makedepends=()
conflicts=("quarto-cli" "quarto-cli-bin" "quarto-cli-git")
provides=("quarto")
options=(!strip)
source_x86_64=(https://github.com/quarto-dev/quarto-cli/releases/download/v${pkgver}/quarto-${pkgver}-linux-amd64.deb)
source_aarch64=(https://github.com/quarto-dev/quarto-cli/releases/download/v${pkgver}/quarto-${pkgver}-linux-arm64.deb)

package() {
    tar xf data.tar.gz -C "${pkgdir}"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s /opt/quarto/bin/quarto "${pkgdir}/usr/bin"
    install -d "$pkgdir/usr/share/man/man1"
    ln -s /opt/quarto/share/man/quarto-man.man "${pkgdir}/usr/share/man/man1/quarto.1"
    ln -s "/opt/quarto/bin/tools/${CARCH}/pandoc" "${pkgdir}/opt/quarto/bin/tools/pandoc" 
}

sha256sums_x86_64=('1a03b23fca9cd5e6fe41b1fb655abf519a6038a9282fe43ac28bb5952d271891')
sha256sums_aarch64=('c16089d1769107145c9eaca3134914a3ac4d69e95ce7c40b1776ef0cabfe8941')

