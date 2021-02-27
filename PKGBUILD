# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ValHue <vhuelamo at gmail dot com>
pkgname=cover-thumbnailer-git
pkgver=0.10.0.r8.gefb375d
pkgrel=1
pkgdesc="Generates folder thumbnails for various file browsers"
arch=('x86_64')
url="https://github.com/flozz/cover-thumbnailer"
license=('GPL3')
depends=('python-pillow' 'python-gobject')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/flozz/cover-thumbnailer.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname%-git}"
    ./install.sh -p "$pkgdir"
}
