# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin
pkgver=3.1.2
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('i686' 'x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL3' 'GPL3')
depends=('qtcreator' 'hunspell')
makedepends=('cmake' 'qtcreator-devel')
conflicts=('qtcreator-spellchecker-plugin-git' 'qtcreator-spellchecker-plugin-bin')
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('cdd09cca7d8de48a8b5fb4112ade6af1f63005453553dbdbd9fb708a85194759')

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
