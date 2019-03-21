# Maintainer: Alexander Bus <busfromrus@gmail.com>

pkgname=nlohmann-json-bin
pkgver=3.6.1
pkgrel=2
pkgdesc='Header-only JSON library for Modern C++ (quick installation without testing)'
arch=('any')
url='https://github.com/nlohmann/json'
license=('MIT')
provides=('nlohmann-json')
conflicts=('nlohmann-json' 'nlohmann-json-git')
source=("include-${pkgver}.zip::https://github.com/nlohmann/json/releases/download/v${pkgver}/include.zip"
        "https://raw.githubusercontent.com/nlohmann/json/v${pkgver}/LICENSE.MIT")
sha256sums=('69cc88207ce91347ea530b227ff0776db82dcb8de6704e1a3d74f4841bc651cf'
            '7400586ce89c6a2cc65f6ca46997da5d356a230673d3a211e040b783f23578a1')

package() {
    cd "${srcdir}"
    install -Dm644 LICENSE.MIT "${pkgdir}/usr/share/licenses/nlohmann-json/LICENSE.MIT"
    cp -R include "${pkgdir}/usr"
}
