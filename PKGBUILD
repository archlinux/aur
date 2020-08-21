# Maintainer: timescam <rex.ky.ng at gmail dot com>

_pkgname=color-scripts-launcher
pkgname=$_pkgname-git
pkgver=r13.876a869
pkgrel=1
pkgdesc="Preview color scripts before launching them"
arch=(any)
url="https://gitlab.com/timescam/$_pkgname"
license=('WTFPL')
depends=('fzf')
makedepends=('git')
optdepends=('shell-color-scripts: provide colorscripts')

provides=("color")

source=("$_pkgname::git+https://gitlab.com/timescam/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package () {
        install -Dm755 "$srcdir/$_pkgname/color" "$pkgdir/usr/bin/color"
}

