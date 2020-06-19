# Maintainer: timescam <rex.ky.ng at gmail dot com>

_pkgname=canvas
pkgname=$_pkgname-git
pkgver=r19.e74dda7
pkgrel=1
pkgdesc="A pretty system information tool written in POSIX sh."
arch=(any)
url="https://github.com/dylanaraps/$_pkgname"
license=("GPL3")
makedepends=("git")
depends=("imagemagick" "feh" "colorpicker")
optdepends=("xrandr: only for xfce to set wallpaper")
provides=("$_pkgname")
conflicts=("pfetch")

source=("$_pkgname::git+https://github.com/adi1090x/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
            cd "$srcdir/$_pkgname"
            echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package () {
            install -Dm755 "$srcdir/$_pkgname/canvas" "$pkgdir/usr/bin/canvas"
}
