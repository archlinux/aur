# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

_pkgname=runin
pkgname=runin-git
pkgver=r5.b40f047
pkgrel=1
pkgdesc='Launch a terminal to run a command, passing on stdin & stdout'
arch=('any')
url="https://github.com/nichobi/$_pkgname"
license=('GPL3')
depends=('bash')
makedepends=('git')
provides=('runin')
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -vDm 755 "$srcdir/$_pkgname"/runin -t "$pkgdir"/usr/bin/
}

