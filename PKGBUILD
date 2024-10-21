# Maintainer: Zhou Qiankang <wszqkzqk@qq.com>

pkgname=live-photo-conv
pkgver=0.1.4
pkgrel=1
pkgdesc="A cross-platform tool to process live photos of Google Android"
url="https://github.com/wszqkzqk/$pkgname"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
    glib2
    libgexiv2
    gstreamer
    gst-plugins-base-libs
    gdk-pixbuf2
)
makedepends=(
    vala
    meson
)
source=("git+https://github.com/wszqkzqk/$pkgname.git#tag=${pkgver}")
sha256sums=('4e79a84e4ee4aea4902a643a70ade9d8a5b256beb0d575cb435ee734b21d16db')

build() {
    arch-meson "${pkgname}" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
