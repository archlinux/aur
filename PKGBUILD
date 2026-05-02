# Maintainer: Pando85 <pando855@gmail.com>
pkgname=swaybeam
pkgver=0.4.3
pkgrel=1
pkgdesc="Miracast source implementation for wlroots-based compositors written in Rust"
arch=('x86_64')
url="https://github.com/forkline/swaybeam"
license=('MIT')
depends=('glibc' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'pipewire')
makedepends=('cargo' 'rust' 'git')

source=("git+https://github.com/forkline/swaybeam.git#tag=v0.4.3")
sha256sums=('SKIP')

pkgver() {
    cd swaybeam
    echo 0.4.3
}

build() {
    cd swaybeam
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd swaybeam
    install -Dm755 "target/release/swaybeam" "${pkgdir}/usr/bin/swaybeam"
}
