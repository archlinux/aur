# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
reponame=gst-plugins-rs
pkgname=gst-plugin-gtk4
pkgver=0.10.6
pkgrel=1
pkgdesc="Multimedia graph framework - GTK4 plugin"
arch=(any)
url="https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
license=(MPL2)
depends=(gstreamer gtk4)
makedepends=(git rust cargo-c)
source=("${url}/-/archive/$pkgver/gst-plugins-rs-$pkgver.tar.bz2")
sha256sums=(90af993b28f050e2d682582ca1bde440665e75a5fbaec6577cafc609e24f2d92)

prepare() {
  cd $reponame-$pkgver
  cargo fetch
}

package() {
  cd $reponame-$pkgver
  cargo cinstall -p gst-plugin-gtk4 --all-features --prefix=/usr --destdir="$pkgdir"
}
