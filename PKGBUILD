# Maintainer : Mike Polvere <mic.tjs@gmail.com>
# Former Maintainer : Michael DeGuzis <mdeguzis@gmail.com>
# Former Maintainer : Lauri Niskanen <ape@ape3000.com>

pkgname=libretro-gambatte-git
pkgver=783.0897d1d
pkgrel=1
pkgdesc="Game Boy / Color libretro core"
arch=('i686' 'x86_64' 'arm' 'armv6h')
_libname=gambatte_libretro
_gitname=gambatte-libretro
url="git+https://github.com/libretro/${_gitname}.git"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs')
makedepends=('git')
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  	cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${_gitname}"
    make -f Makefile.libretro
}

package() {
    install -Dm644 "${srcdir}/${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
