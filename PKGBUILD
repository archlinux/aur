# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin
pkgver=3.6.0
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL3' 'GPL3')
depends=('qtcreator' 'hunspell')
makedepends=('cmake' 'qtcreator-devel')
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('3887679e5cade0eea876ca413472284cad882e09ec2680fb44d761b92e45df94')

build() {
    cmake \
        -S SpellChecker-Plugin-$pkgver\
        -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_DIR=/usr/lib/cmake/Qt6
#         -DCMAKE_BUILD_TYPE=Release \
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
