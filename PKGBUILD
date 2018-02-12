# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gradio
pkgver=7.1
pkgrel=1
pkgdesc='A GTK3 app for finding and listening to internet radio stations'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/haecker-felix/gradio"
depends=('desktop-file-utils' 'gstreamer' 'gst-plugins-ugly' 'gst-plugins-bad' 
          'gtk3' 'gobject-introspection' 'gst-plugins-base' 'gst-plugins-good' 
          'json-glib' 'libgee' 'sqlite3' 'libsoup')
makedepends=('gnome-common' 'meson' 'gettext' 'appstream-glib' 'vala' 'yelp-tools')
options=('!emptydirs')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b223b371bfc82831fcbf3699bb4bfa7288438d02e9351b707b1f32db7ea5f7e3')
conflicts=('gradio-git' 'gradio-bin')
provides=("gradio=${pkgver}")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson builddir --prefix=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
