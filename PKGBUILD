# Maintainer: PandaDEV <contact@pandadev.net>
pkgname=ufrume
pkgver=1.0.1
pkgrel=1
pkgdesc='A multithreaded CLI tool to organize your music files into a folder structure defined by you.'
arch=(x86_64 aarch64)
url='https://github.com/0PandaDEV/ufrume'
license=(GPL-3.0)
makedepends=(cargo)
source=(ufrume-$pkgver.tar.gz::https://github.com/0PandaDEV/ufrume/archive/v$pkgver.tar.gz)
sha256sums=('SKIP')

build() {
    cd "$srcdir/ufrume-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/ufrume-$pkgver"
    install -Dm755 target/release/ufrume "$pkgdir/usr/bin/ufrume"
}