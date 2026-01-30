# Maintainer: Seas0 <season1277@outlook.com>
_pkgname=GstPipelineStudio
pkgname=gst-pipeline-studio
pkgver=0.4.0
pkgrel=1
pkgdesc='GstPipelineStudio aims to provide a graphical user interface to the GStreamer framework.'
url='https://dabrain34.pages.freedesktop.org/GstPipelineStudio'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gtk4' 'gcc-libs' 'glib2' 'graphene' 'cairo' 'gdk-pixbuf2' 'gstreamer' 'gst-plugins-base-libs' 'gst-plugin-gtk4')
makedepends=('meson' 'ninja' 'pkgconf' 'cargo')
#optdepends=()
options=()
source=("https://gitlab.freedesktop.org/dabrain34/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('917e573c7b17a1cdf216ffef0661ded2176d06378f32ee2545134012056a833e')

build() {
	arch-meson "$_pkgname-$pkgver" build --buildtype=release --prefix='/usr'
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir="$pkgdir"
}
