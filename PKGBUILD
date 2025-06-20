# Maintainer: Adrià Arrufat A <swiftscythe@gmail.com>

pkgname=opencode
pkgver=0.0.53
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with Google Gemini AI'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/geminicommit'
license=('GPL3')
depends=('git')
makedepends=('go')
source=("https://github.com/opencode-ai/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('53e23c62284a50c38fd664de441b6db540fa5c944358fffd319f548ee504cb84')


build() {
    cd ${pkgname}-${pkgver}
    go build
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 opencode "${pkgdir}/usr/bin/opencode"
    install -D LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
