# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin
pkgver=3.2.0
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL3' 'GPL3')
depends=('qtcreator' 'hunspell')
makedepends=('cmake' 'qtcreator-devel')
conflicts=('qtcreator-spellchecker-plugin-git' 'qtcreator-spellchecker-plugin-bin')
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('ad0a32cd0986a981fec94cbb4be0352ad0805044bce52169ec588858e37f01ea')

build() {
    cmake \
        -S SpellChecker-Plugin-$pkgver\
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
