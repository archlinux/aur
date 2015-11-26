# Maintainer: Ted Meyer <tmathmeyer@gmail.com>

pkgname=tint3
pkgver=205
pkgrel=1
pkgdesc='An independant status bar for X11 (works best with bspwm)'
arch=('x86_64')
url="https://github.com/tmathmeyer/${pkgname}"
license=('GPL')
depends=('libxft' 'xcb-util-wm' 'libxinerama')
makedepends=('git' 'libx11' 'xcb-util')
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}" "tint3-cpp-git")
conflicts=("${pkgname}" "tint3-git")
source=("https://github.com/tmathmeyer/tint3/archive/v205.zip")
md5sums=('27592e4b4456cd69aa85c2f75daec566')

build() {
    cd "$srcdir/$pkgname-$pkgver/src"
    make update
}

package() {
    installDir="$pkgdir/usr/bin"
    fontDir="$pkgdir/usr/share/fonts/TTF"
    install -dm755 "$installDir"
    install -dm755 "$fontDir"
    install -m755 "$srcdir/$pkgname-$pkgver/fonts/sakamoto-11.bdf" "$fontDir/sakamoto-11.bdf"
    install -m755 "$srcdir/$pkgname-$pkgver/src/tint3" "$installDir/tint3"
}
