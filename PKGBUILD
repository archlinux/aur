# Maintainer: Tobi Lutke <tobi@shopify.com>
pkgname=try-cli
pkgver=1.5.2
pkgrel=1
pkgdesc="A fast, interactive CLI tool for managing ephemeral development workspaces"
arch=('x86_64' 'aarch64')
url="https://github.com/tobi/try-cli"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
provides=('try')
conflicts=('try')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tobi/try-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('896b5390f225d0a5235807111e521acdf8208f15a7d41e3779dd51372c7bc8e9')

pkgver() {
    cat "$srcdir/$pkgname-$pkgver/VERSION" | tr -d '\n'
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 dist/try "$pkgdir/usr/bin/try"
}
