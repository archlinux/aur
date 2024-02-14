# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=quarto-cli-bin-pre-release
pkgver="1.5.14"
pkgrel=1
pkgdesc="An open-source scientific and technical publishing system built on Pandoc  (pre-release binary from official repo)"
arch=('x86_64')
license=('GPL')
url="http://quarto.org/"
depends=('bash')
makedepends=()
conflicts=("quarto-cli" "quarto-cli-bin" "quarto-cli-git")
provides=("quarto")
options=(!strip)
source=(https://github.com/quarto-dev/quarto-cli/releases/download/v${pkgver}/quarto-${pkgver}-linux-amd64.deb)

package() {
    tar xf data.tar.gz -C "${pkgdir}"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s /opt/quarto/bin/quarto "${pkgdir}/usr/bin"
    ln -s "/opt/quarto/bin/tools/${arch}/pandoc" "${pkgdir}/opt/quarto/bin/tools/pandoc" 
}

sha256sums=('4833285ffc6f1ab738e04ff1759fd5579544d9ca82d73b1285ca64f81c969a5d')

