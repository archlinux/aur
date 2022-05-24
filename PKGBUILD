# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin
pkgver=3.0.0
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt' 'qt5' 'qt6')
arch=('i686' 'x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL3')
depends=('qtcreator' 'hunspell')
makedepends=('cmake' 'qtcreator-devel')
conflicts=('qtcreator-spellchecker-plugin-git' 'qtcreator-spellchecker-plugin-bin')
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('42c08467a7111f17e60504154865eb3fae7cfe667618d19f16e753e1fe9826ca')

build() {
    cmake \
        -G Ninja \
        -S SpellChecker-Plugin-$pkgver\
        -B build \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    install -D "build/lib/qtcreator/plugins/libSpellChecker.so" "${pkgdir}/usr/lib/qtcreator/plugins/libSpellChecker.so"
}
