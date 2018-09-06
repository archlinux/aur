# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=timelens
pkgver=0.1.0
pkgrel=1
pkgdesc="Creates visual timelines from video files, to visualize color development. Inspired by the moviebarcode tumblr."
arch=('i686' 'x86_64')
url="https://github.com/timelens/timelens"
license=('GPL')
provides=('timelens')
conflicts=('timelens')
depends=('gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
makedepends=('git' 'rust')
source=(https://github.com/timelens/$pkgname/archive/$pkgver.tar.gz)
md5sums=('81612aca6ccb386c808cda4ffe0af7a7')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/timelens" "$pkgdir/usr/bin/timelens"
}
