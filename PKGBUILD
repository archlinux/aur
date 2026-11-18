pkgname=poptato-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Keyboard-driven app launcher, command runner, and fuzzy menu for Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/skorotkiewicz/poptato'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
provides=('poptato')
conflicts=('poptato')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/poptato-${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/poptato-${pkgver}-aarch64-linux.tar.gz")
sha256sums_x86_64=('dabb026115509c40c367abdd486e287ed4d9b5eae1d1be9a64aafae4b27606cb')
sha256sums_aarch64=('8ededddce690af31499d7a193e4953cdf71b1d52eeea3a11e98d1943820d0f94')

package() {
    install -Dm755 poptato "${pkgdir}/usr/bin/poptato"
    install -Dm644 config.toml "${pkgdir}/usr/share/doc/${pkgname}/config.toml"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
