# Maintainer: Cullen Ross <cullenrss@gmail.com>

_pkgname='desknamer'
pkgname="${_pkgname}-git"
pkgver=r41.c81f631
pkgrel=2
pkgdesc='automatically rename bspwm desktops based on applications inside'
arch=('any')
url="https://gitlab.com/jallbrit/${_pkgname}"
license=('GPL3')
depends=('bspwm' 'python' 'bash')
makedepends=('git')
provides=('desknamer')
source=("${_pkgname}::git+${url}.git")
md5sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    make install
}
