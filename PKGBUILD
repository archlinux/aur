# Maintainer: Tobi Lutke <tobi@shopify.com>
pkgname=try-cli
pkgver=1.2.1
pkgrel=1
pkgdesc="A fast, interactive CLI tool for managing ephemeral development workspaces"
arch=('x86_64' 'aarch64')
url="https://github.com/tobi/try-c"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
provides=('try')
conflicts=('try')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tobi/try-c/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "try-c-$pkgver"
    make
}

package() {
    cd "try-c-$pkgver"
    install -Dm755 dist/try "$pkgdir/usr/bin/try"
}
