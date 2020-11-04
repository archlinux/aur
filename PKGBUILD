# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>
# Contributor: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>

pkgname=marp-cli-bin
pkgver=0.22.0
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

sha256sums=("86341d9df68ba1ee80a72737cf440f5ac85575a9cc89abb725a82ee502853df8" "f2b31d0b3aa8ec75832e76b5deb842d8889f7121e9419414b4e32ab37327e64b")

package() {
	# There's only a bare binary in the tarball
        install -Dm755 "${srcdir}/marp" "${pkgdir}/usr/bin/marp"
        install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
