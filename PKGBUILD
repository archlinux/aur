# Maintainer: Alexander Bus <busfromrus@gmail.com>

pkgname=nlohmann-json-bin
pkgver=3.6.0
pkgrel=1
pkgdesc='Header-only JSON library for Modern C++ (quick installation without testing)'
arch=('any')
url='https://github.com/nlohmann/json'
license=('MIT')
provides=('nlohmann-json')
conflicts=('nlohmann-json' 'nlohmann-json-git')
source=("include-${pkgver}.zip::https://github.com/nlohmann/json/releases/download/v${pkgver}/include.zip"
        "https://raw.githubusercontent.com/nlohmann/json/v${pkgver}/LICENSE.MIT")
sha256sums=('237c5e66e7f8186a02804ce9dbd5f69ce89fe7424ef84adf6142e973bd9532f4'
            '7b875bb7a4e28abb7956ea821b4b7d88ff6a2a4fabf261c3993730a365ec56dd')

package() {
    cd "${srcdir}"
    install -Dm644 LICENSE.MIT "${pkgdir}/usr/share/licenses/nlohmann-json/LICENSE.MIT"
    cp -R include "${pkgdir}/usr"
}
