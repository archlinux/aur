# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
reponame=gst-plugins-rs
pkgname=gst-plugin-gtk4
pkgver=0.10.9
pkgrel=1
pkgdesc="Multimedia graph framework - GTK4 plugin"
arch=(any)
url="https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
license=(MPL2)
depends=(gstreamer gtk4)
makedepends=(rust cargo-c)
source=("${url}/-/archive/$pkgver/gst-plugins-rs-$pkgver.tar.bz2")
sha256sums=(919c65b35b0787a726dd572be65ced0184855cb5b4314e4c347082633b37ceab)

prepare() {
  cd $reponame-$pkgver
  cargo fetch
}

package() {
  cd $reponame-$pkgver
  cargo cinstall -p gst-plugin-gtk4 \
    --release \
    --prefix=/usr \
    --all-features \
    --destdir="$pkgdir" \
    --library-type=cdylib
}
