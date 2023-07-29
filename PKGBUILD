# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin
pkgver=3.4.0
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
sha256sums=('57388f1ba7499039c765aaae996f9527bcac136b3d27a70e17ec63448e53a1a7')

build() {
    cmake \
        -S SpellChecker-Plugin-$pkgver\
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_DIR=/usr/lib/cmake/Qt6
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
