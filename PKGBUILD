# Maintainer: Alad Wenter <https://github.com/AladW>
pkgname=aurutils-git
pkgver=1.5.3.r322.g1707e9b
pkgrel=1
pkgdesc='helper tools for the arch user repository'
url='https://github.com/AladW/aurutils'
arch=('any')
license=('custom:ISC')
source=('git+https://github.com/AladW/aurutils')
sha256sums=('SKIP')
conflicts=('aurutils')
provides=('aurutils')
depends=('pacman>=5.0' 'git' 'jq' 'pacutils' 'wget' 'diffstat')
makedepends=('git')
optdepends=('devtools: aur-build-nspawn'
            'expac: aur-rfilter'
            'aria2: threaded downloads'
            'vifm: build file interaction')

pkgver() {
    cd aurutils
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd aurutils
    make DESTDIR="$pkgdir"
}

package() {
    cd aurutils
    make DESTDIR="$pkgdir" install
}
