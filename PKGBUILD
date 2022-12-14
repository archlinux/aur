# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
reponame=gst-plugins-rs
pkgname=gst-plugin-gtk4-git
pkgver=r2347.e5360ff4
pkgrel=1
pkgdesc="Multimedia graph framework - GTK4 plugin"
arch=(any)
url="https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
license=(MPL2)
provides=(gst-plugin-gtk4)
conflicts=(gst-plugin-gtk4)
depends=(gstreamer gtk4)
makedepends=(git rust cargo-c)
source=("${reponame}"::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$reponame"/video/gtk4
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$reponame"/video/gtk4
  cargo cinstall -p gst-plugin-gtk4 --all-features --prefix=/usr --destdir="$pkgdir"
}
