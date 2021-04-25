# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>
# Contributor: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>

pkgname=marp-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI interface for Marp and Marpit based converters"
arch=('x86_64' 'i686')
url="https://github.com/marp-team/marp-cli"
license=('MIT')
depends=('gcc-libs')
conflicts=('marp-cli')
options=('!strip') # Stripping causes "Pkg: Error reading from file."
replaces=('marp')

# Package
source=("${url}/releases/download/v${pkgver}/marp-cli-v${pkgver}-linux.tar.gz" "https://raw.githubusercontent.com/marp-team/marp-cli/master/LICENSE")

sha256sums=('1aa9eb39f818593ebfd3e94da014142a6932c250ebd3b97f500a65bc52984672'
            'f2b31d0b3aa8ec75832e76b5deb842d8889f7121e9419414b4e32ab37327e64b')

package() {
        # There's only a bare binary in the tarball
        install -Dm755 "${srcdir}/marp" "${pkgdir}/usr/bin/marp"
        install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
