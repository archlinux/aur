# Maintainer: Alexander Bus <busfromrus@gmail.com>

pkgname=nlohmann-json-bin
pkgver=3.7.0
pkgrel=2
pkgdesc='Header-only JSON library for Modern C++ (quick installation without testing)'
arch=('any')
url='https://github.com/nlohmann/json'
license=('MIT')
provides=('nlohmann-json')
conflicts=('nlohmann-json' 'nlohmann-json-git')
source=("include-${pkgver}.zip::https://github.com/nlohmann/json/releases/download/v${pkgver}/include.zip"
        "https://raw.githubusercontent.com/nlohmann/json/v${pkgver}/LICENSE.MIT"
        "nlohmann_json-config.cmake"
        "nlohmann_json-config-version.cmake")
sha256sums=('541c34438fd54182e9cdc68dd20c898d766713ad6d901fb2c6e28ff1f1e7c10d'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    cd "${srcdir}"
    install -Dm644 LICENSE.MIT "${pkgdir}/usr/share/licenses/nlohmann-json/LICENSE.MIT"
    install -Dm644 nlohmann_json-config.cmake "${pkgdir}/usr/lib/cmake/nlohmann_json/nlohmann_json-config.cmake"
    install -Dm644 nlohmann_json-config-version.cmake "${pkgdir}/usr/lib/cmake/nlohmann_json/nlohmann_json-config-version.cmake"
    cp -R include "${pkgdir}/usr"
}
