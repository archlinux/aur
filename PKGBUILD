# Maintainer: Ted Meyer <tmathmeyer@gmail.com>

pkgname=tint3
pkgver=201
pkgrel=1
pkgdesc='An independant status bar for X11 (works best with bspwm)'
arch=('x86_64')
url="https://github.com/tmathmeyer/${_pkgname}"
license=('GPL')
depends=('libxft' 'xcb-util-wm' 'libxinerama')
makedepends=('git' 'libx11' 'xcb-util')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}" "tint3-cpp-git")
conflicts=("${_pkgname}" "tint3-git")
source=("git://github.com/tmathmeyer/${_pkgname}.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname/src"
    make update
}

package() {
    installDir="$pkgdir/usr/bin"
    fontDir="$pkgdir/usr/share/fonts/TTF"
    install -dm755 "$installDir"
    install -dm755 "$fontDir"
    install -m755 "$srcdir/$_pkgname/fonts/sakamoto-11.bdf" "$fontDir/sakamoto-11.bdf"
    install -m755 "$srcdir/$_pkgname/src/tint3" "$installDir/tint3"
}
