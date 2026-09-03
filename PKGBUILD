# Maintainer: djvs <contact@viathegitlabrepo.com>
_pkgname=treemp
pkgname=${_pkgname}-git
pkgver=r.
pkgrel=1
pkgdesc="ncurses/python directory based CLI music player, based on mutagen and libav/soundcard"
arch=('any')
url="https://gitlab.com/djvs/treemp"
license=('GPL3')
depends=(
    'python'
    'python-av'
    'python-mutagen'
    'python-soundcard'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git')
source=("${_pkgname}::git+https://gitlab.com/djvs/treemp.git#branch=main")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
}

package() {
    cd "${srcdir}/treemp"
    install -Dm755 "$srcdir/treemp/treemp.py" "$pkgdir/usr/bin/treemp"
}
