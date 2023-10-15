# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=quarto-cli-bin-pre-release
pkgver="1.4.424"
pkgrel=6
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

sha256sums=('9d9f23ad7324537df3c8a8deca736868f142599a8b8c5cfdd0aa42575097d1c5')

