# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Ainola

pkgname=imv-git
pkgver=v2.1.3.r202.ge278e28
pkgrel=1
pkgdesc='imv is a command line image viewer intended for use with tiling window managers, with Wayland and X11 support.'
url="https://github.com/eXeC64/imv"
arch=('x86_64' 'i686')
license=('MIT')
depends=('freeimage' 'sdl2_ttf' 'fontconfig')
makedepends=('git' 'asciidoc')
provides=('imv')
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
