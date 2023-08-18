# Maintainer: Fijxu <fijxu <at> zzls <dot> xyz>

pkgname=dataplaneapi-git
_pkgname=dataplaneapi
pkgver=2.7.0.r77.gb66268a
pkgrel=1
pkgdesc="HAProxy Data Plane API (git version)"
arch=('any')
url="https://github.com/folbricht/routedns"
license=('Apache')
makedepends=('git' 'go>=1.20')
provides=('dataplaneapi')
source=("git+https://github.com/haproxytech/dataplaneapi.git")
sha512sums=("SKIP")
pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
    cd "$srcdir/$_pkgname"
    make build
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 build/dataplaneapi "$pkgdir"/usr/bin/dataplaneapi
    install -Dm644 LICENSE "$pkgdir"/usr/share/license/dataplaneapi/LICENSE
    install -Dm644 README.md "$pkgdir"/usr/share/doc/dataplaneapi/README.md
}

