# Maintainer: Alexander Bus <busfromrus@gmail.com>

pkgname=nlohmann-json-bin
pkgver=3.3.0
pkgrel=1
pkgdesc='Header-only JSON library for Modern C++ (quick installation without testing)'
arch=('any')
url='https://github.com/nlohmann/json'
license=('MIT')
provides=('nlohmann-json')
conflicts=('nlohmann-json' 'nlohmann-json-git')
source=("include-${pkgver}.zip::https://github.com/nlohmann/json/releases/download/v${pkgver}/include.zip"
        "https://raw.githubusercontent.com/nlohmann/json/v${pkgver}/LICENSE.MIT")
sha256sums=('9588d63557333aaa485e92221ec38014a85a6134e7486fe3441e0541a5a89576'
            '7b875bb7a4e28abb7956ea821b4b7d88ff6a2a4fabf261c3993730a365ec56dd')

package() {
    cd "${srcdir}"
    install -Dm644 LICENSE.MIT "${pkgdir}/usr/share/licenses/nlohmann-json/LICENSE.MIT"
    cp -R include "${pkgdir}/usr"
}
