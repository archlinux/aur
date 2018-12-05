# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: brainblasted <brainblasted at disroot dot org>

pkgname=gnome-podcasts
pkgver=0.4.6
pkgrel=1
pkgdesc="A Podcast Client for the GNOME Desktop written in Rust"
arch=(x86_64 i686)
license=(GPL3)
url="https://gitlab.gnome.org/World/podcasts"
depends=(sqlite gtk3 gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav gspell libhandy)
makedepends=(rust meson)
source=("https://gitlab.gnome.org/World/podcasts/-/archive/${pkgver}/podcasts-${pkgver}.tar.gz")
sha256sums=('953c63e8184ca1f748418d8a8262d40eaa41047f81e2d2c874a3035d9d9d0e4a')

build() {
    cd "podcasts-${pkgver}"
    arch-meson . _build
    ninja -C _build
}

package() {
    cd "podcasts-${pkgver}"
    DESTDIR="$pkgdir" ninja -C _build install
}
