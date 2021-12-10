# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

pkgname=certinfo
pkgver=1.0.6
pkgrel=1
pkgdesc='Print x509 certificate info'
arch=('x86_64')
url='https://github.com/pete911/certinfo'
makedepends=(
    "go"
    "git"
)
license=('MIT')
source=("$pkgname-$pkgver.zip::https://github.com/pete911/certinfo/archive/refs/tags/v${pkgver}.zip")
sha256sums=('cd0ad8abb7fb2fc39b77047d70619b91f14d4c473a88653151f42f06c94338c2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make VERSION=${pkgver} build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    #install -dm755 $pkgdir/usr/bin
    install -Dm755 certinfo $pkgdir/usr/bin/certinfo
}
