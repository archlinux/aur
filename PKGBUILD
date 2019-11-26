# Maintainer: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>

pkgname=marp-cli-bin
pkgver=0.16.2
pkgrel=1
pkgdesc="A CLI interface for Marp and Marpit based converters"
arch=('x86_64' 'i686')
url="https://github.com/marp-team/marp-cli"
license=('MIT')
depends=('gcc-libs')
options=('!strip') # Stripping causes "Pkg: Error reading from file."
replaces=('marp')

# Package
source=("${url}/releases/download/v${pkgver}/marp-cli-v${pkgver}-linux.tar.gz" "${url}/raw/master/LICENSE")

md5sums=("b27725c2dce5b93bae88cfa7d322c6bb" "9729370075c7b819f9579d15ef647bb9")

package() {
	# There's only a bare binary in the tarball
        install -Dm755 "${srcdir}/marp" "${pkgdir}/usr/bin/marp"
        install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
