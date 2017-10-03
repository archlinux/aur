# Maintainer: Florent Thiéry fthiery@gmail.com
pkgname=gst-instruments-git
pkgver=0.1
pkgrel=1
pkgdesc="Set of performance analyzing tools for time profiling and data flow inspection in GStreamer apps."
arch=('i686' 'x86_64')
url="https://github.com/kirushyk/gst-instruments"
license=('GPL3')
depends=('gstreamer' 'gtk3' 'vala' 'xdot')
#https://github.com/kirushyk/gst-instruments/issues/29
#source=('git+https://github.com/kirushyk/gst-instruments.git')
source=('git+https://github.com/ribalda/gst-instruments.git#branch=fix29')
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
