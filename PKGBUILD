# Maintainer: Ainola

pkgname=imv-git
pkgver=v2.1.3.r131.g7221ef8
pkgrel=1
pkgdesc='Image viewer for Wayland and X11'
url="https://github.com/eXeC64/imv"
arch=('x86_64' 'i686')
license=('GPL')
depends=('freeimage' 'sdl2_ttf' 'fontconfig')
makedepends=('git' 'asciidoc')
conflicts=('renameutils' 'imv')
source=("git+https://github.com/eXeC64/imv.git")
sha1sums=('SKIP')

pkgver() {
    cd imv
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make -C imv BUILDDIR=build
}

package() {
    make -C imv BUILDDIR=build DESTDIR="$pkgdir" install
}
