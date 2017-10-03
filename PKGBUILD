# Maintainer: Florent Thiéry fthiery@gmail.com
pkgname=gst-instruments-git
pkgver=0.1
pkgrel=2
pkgdesc="Set of performance analyzing tools for time profiling and data flow inspection in GStreamer apps."
arch=('i686' 'x86_64')
url="https://github.com/kirushyk/gst-instruments"
license=('GPL3')
depends=('gstreamer' 'gtk3' 'vala' 'xdot')
source=('git+https://github.com/kirushyk/gst-instruments.git')
sha512sums=('SKIP')

build() {
    cd gst-instruments
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd gst-instruments
    make DESTDIR="$pkgdir/" install
}
