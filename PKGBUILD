# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gradio
_pkgname=Gradio
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
sha256sums=('7b350583124f00f9030daaf4042cd54c9d340d67124dad298266d2dfa81ba766')
conflicts=('gradio-git' 'gradio-bin')
provides=("gradio=${pkgver}")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	meson builddir --prefix=/usr
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
