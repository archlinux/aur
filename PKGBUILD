# Maintainer: Djwarf <djwarf@outlook.com>
pkgname=switcharch-control-center
pkgver=0.1.0
pkgrel=1
pkgdesc="Unified settings application for SwitchArch Desktop"
arch=('x86_64')
url="https://github.com/switcharch/switcharch-control-center"
license=('MIT')
depends=('gtk4' 'libadwaita' 'glib2' 'dbus' 'networkmanager' 'bluez-utils')
makedepends=('cargo' 'gcc' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/switcharch-control-center "$pkgdir/usr/bin/switcharch-control-center"
    install -Dm644 switcharch-control-center.desktop "$pkgdir/usr/share/applications/switcharch-control-center.desktop"
}
