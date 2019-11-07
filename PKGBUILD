# Maintainer: Alexander Bus <busfromrus@gmail.com>

pkgname=nlohmann-json-bin
pkgver=3.7.1
pkgrel=1
pkgdesc='Header-only JSON library for Modern C++ (quick installation without testing)'
arch=('any')
url='https://github.com/nlohmann/json'
license=('MIT')
provides=('nlohmann-json')
conflicts=('nlohmann-json' 'nlohmann-json-git')
source=("include-${pkgver}.zip::https://github.com/nlohmann/json/releases/download/v${pkgver}/include.zip"
        "https://raw.githubusercontent.com/nlohmann/json/v${pkgver}/LICENSE.MIT"
        "nlohmann_jsonConfig.cmake"
        "nlohmann_jsonConfigVersion.cmake"
        "nlohmann_jsonTargets.cmake")
sha256sums=('77b9f54b34e7989e6f402afb516f7ff2830df551c3a36973085e2c7a6b1045fe'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    cd "${srcdir}"
    install -Dm644 LICENSE.MIT "${pkgdir}/usr/share/licenses/nlohmann-json/LICENSE.MIT"
    install -Dm644 nlohmann_jsonConfig.cmake "${pkgdir}/usr/lib/cmake/nlohmann_json/nlohmann_jsonConfig.cmake"
    install -Dm644 nlohmann_jsonConfigVersion.cmake "${pkgdir}/usr/lib/cmake/nlohmann_json/nlohmann_jsonConfigVersion.cmake"
    install -Dm644 nlohmann_jsonTargets.cmake "${pkgdir}/usr/lib/cmake/nlohmann_json/nlohmann_jsonTargets.cmake"
    cp -R include "${pkgdir}/usr"
}
