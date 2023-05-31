# Maintainer: Nonie <read_only@gmx.us>
#
# Contributor: Alley_Cat <read_only@gmx.us>
#
_pkgname="opera-proxy"
pkgname="opera-proxy-git"
pkgver="1.2.4"
pkgrel="1"
pkgdesc="Standalone Opera VPN client as http-proxy backend only"
url="https://github.com/Snawoot/opera-proxy"
license=('MIT')
depends=(go)
makedepends=(git)
arch=('i686' 'x86_64')
source=("git+https://github.com/Snawoot/opera-proxy.git")
sha512sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "$srcdir"/$_pkgname/bin/opera-proxy -t "$pkgdir"/usr/bin/
}

# vim:set ts=4 sw=2 ft=sh et:
