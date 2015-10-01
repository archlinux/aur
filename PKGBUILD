# Maintainer: Adrien Oliva <yapbreak@yapbreak.fr>
pkgname="yaplog-git"
pkgver="2.2.1"
pkgrel="2"
pkgdesc="Log system library for C/C++ projects"
arch=('any')
url="https://redmine.yapbreak.fr/projects/yaplog"
license=('GPL3')
depends=()
optdepends=()
makedepends=('gcc')
conflicts=('YapLog')
replaces=()
backup=()
source=('git+https://redmine.yapbreak.fr/log.git')
noextract=()
md5sums=('SKIP')

build() {
    cd "${srcdir}/log"
    ./autogen.sh
    ./configure
    make
    make check
}

package() {
    cd "${srcdir}/log"
    make DESTDIR="${pkgdir}/" install
}
