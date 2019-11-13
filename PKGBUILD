# Maintainer: timescam <rex.ky.ng at gmail dot com>

_pkgname=rofigen
pkgname=$_pkgname-git
pkgver=r19.287d7f1
pkgrel=1
pkgdesc="A framework to easily create personal Rofi menus."
arch=(any)
url="https://github.com/losoliveirasilva/$_pkgname"
license=('')
makedepends=('git')
depends=(
    'rofi'
    'bash'
)
provides=("$_pkgname")

source=("$_pkgname::git+https://github.com/losoliveirasilva/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
            cd "$srcdir/$_pkgname"
            echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package () {
            install -Dm755 "$srcdir/$_pkgname/rofigen" "$pkgdir/usr/bin/rofigen"
}