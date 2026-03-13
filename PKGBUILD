# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=quarto-cli-bin-pre-release
pkgver="1.9.34"
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

sha256sums_x86_64=('b03aac06276943dd79c7b1fa779f8c5c4b6ffd3d98a8de62434ceada624ca109')
sha256sums_aarch64=('772045586c9343d9316b61919af6cfe926bf13e4e51fcd2a1762b3ce708db863')

