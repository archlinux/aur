# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=quarto-cli-bin-pre-release
pkgver="1.8.1"
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

sha256sums_x86_64=('e3e520a4f05b47aa6a47dc87c91cca425c305ff2ff34ed12a4c7b121e4e8f196')
sha256sums_aarch64=('18204881eb76f1491945cc93d3ba0905f15c556dc73311d22d90da1a7216f483')

