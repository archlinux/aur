# Maintainer: neodarz <neodarz@neodarz.net>

_pkgname=darksky
pkgname=$_pkgname-git
pkgver=r64.ff4f21e
pkgrel=1
pkgdesc="Command line weather forecasts from darksy.net"
arch=('i686' 'x86_64')
url="https://github.com/sieste/$_pkgname"
license=('unknown')
depends=(python2)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/sieste/$_pkgname.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 darksky "$pkgdir/usr/bin/$_pkgname"
}

