# Maintainer: timescam <rex.ky.ng at gmail dot com>

_pkgname=mustream
pkgname=$_pkgname-git
pkgver=r38.f0d6c02
pkgrel=1
pkgdesc="A quick 'hack' to stream any music (from spotify) through the command line."
arch=(any)
url="https://github.com/belkadev/$_pkgname"
license=('GPL3')
makedepends=('git')
depends=(
    'spotify'
    'bash'
)
provides=("$_pkgname")

source=("$_pkgname::git+https://github.com/belkadev/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
            cd "$srcdir/$_pkgname"
            echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package () {
            install -Dm755 "$srcdir/$_pkgname/mustream.sh" "$pkgdir/usr/bin/play"
}