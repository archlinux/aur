# Maintainer: Quey-Liang Kao<s101062801@m101.nthu.edu.tw>

pkgname=tmssh-git
pkgver=r27.85c40f8
pkgrel=1
pkgdesc="SSH multiplexer over servers and tmux"
depends=('bash' 'tmux')
#makedepends=()
arch=('x86_64' 'i686')
source=("git+https://github.com/greymd/tmssh.git")
url="https://github.com/greymd/tmssh.git"
provides=('tmssh')
#conflicts=('tmssh')
license=("MIT")
sha256sums=('SKIP')

prepare() {
    cd $srcdir/tmssh

    # nothing to prepare currently
}

build() {
    cd $srcdir/tmssh

    # nothing to build as well
}

package() {
    cd $srcdir/tmssh
    install -Dm755 tmssh $pkgdir/usr/bin/tmssh
}

pkgver() {
    cd $srcdir/tmssh
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
