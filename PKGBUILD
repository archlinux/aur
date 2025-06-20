# Maintainer: wackbyte <im@purring.fyi>
# Contributor: telans <telans@protonmail.com>
# Contributor: Simon Tas <simon.tas.st@gmail.com>

_pkgname=SamRewritten-legacy
pkgname=samrewritten-legacy-git
pkgver=r266.02fea42
pkgrel=1
pkgdesc='Steam Achievement Manager (legacy version compatible with non-Snap Steam)'
arch=('any')
url='https://github.com/PaulCombal/SamRewritten-legacy'
license=('GPL3')
depends=('steam' 'yajl' 'gtkmm3' 'glibc' 'curl')
optdepends=('zenity: error messages with style'
            'valgrind: for automated dev script'
            'massif-visualizer: for automated dev script')
makedepends=('git' 'make' 'gcc>=9.0')
source=("${_pkgname}::git+https://github.com/PaulCombal/SamRewritten-legacy.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    make
}

package() {
    cd $_pkgname
    make DESTDIR="${pkgdir}" install
}
