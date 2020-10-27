# Maintainer: Florent Thiéry fthiery@gmail.com
pkgname=gst-instruments-git
pkgver=0.1
pkgrel=4
pkgdesc="Set of performance analyzing tools for time profiling and data flow inspection in GStreamer apps."
arch=(x86_64)
url="https://github.com/kirushyk/gst-instruments"
license=(GPL3)
depends=(gstreamer gtk3 vala xdot)
makedepends=(meson git)
source=('git+https://github.com/kirushyk/gst-instruments.git')
sha512sums=('SKIP')

build() {
    cd gst-instruments
    meson --prefix /usr --buildtype=plain builddir
    meson compile -C builddir
    meson test -C builddir
}

package() {
    cd gst-instruments
    DESTDIR="$pkgdir/" meson install -C builddir
}
