# Maintainer: dhruvasambrani <dhruvasambrani19 at gmail>

pkgname=quarto-cli-bin-pre-release
pkgver="1.5.50"
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
    install -d "$pkgdir/usr/share/man/man1"
    ln -s /opt/quarto/share/man/quarto-man.man "${pkgdir}/usr/share/man/man1/quarto.1"
    ln -s "/opt/quarto/bin/tools/${CARCH}/pandoc" "${pkgdir}/opt/quarto/bin/tools/pandoc" 
}

sha256sums=('545d81a80d1f24a5f1199cdf5943b351f5a15a52767c71be16424c7ecc12dd2f')

