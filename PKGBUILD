# Contributor: Luxzi <luxzi@pm.me>

pkgname="libleif"
_pkgname="leif"
pkgver='1.0'
pkgrel=2
pkgdesc="Minimal, configurable & GPU accelerated Immediate Mode UI Library written with modern OpenGL"
arch=('x86_64')
url="https://github.com/cococry/leif"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'make' 'gcc' 'glfw' 'cglm' 'libclipboard')
provides=('libleif')
source=("${_pkgname}::git+https://github.com/cococry/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo $pkgver
}

build() {
    cd $_pkgname
    make
}

package() {
    cd $_pkgname

    # install archive and header file
    install -vDm644 "lib/libleif.a" "$pkgdir/usr/local/lib/libleif.a"
    install -vDm644 "include/leif/leif.h" "$pkgdir/usr/local/include/leif/leif.h"

    # TODO: Currently no license file
    # install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
