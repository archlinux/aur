# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
_name=stag-graph
pkgname="${_name}-git"
pkgdesc='streaming bar graphs, for stats and stuff'
arch=('i686' 'x86_64')
url='https://github.com/seenaburns/stag'
pkgver=107.76c7b36
pkgrel=1
depends=('ncurses')
provides=('stag-graph')
conflicts=('stag-graph' 'stag-git')
source=("${_name}::git+${url}")
sha256sums=('SKIP')

pkgver () {
    cd "${srcdir}/${_name}"
    printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "${srcdir}/${_name}"
    make
}

package () {
    cd "${srcdir}/${_name}"
    make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
