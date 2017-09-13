# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gradio
_gitname=gradio
pkgver=6.0
pkgrel=1
pkgdesc='A GTK3 app for finding and listening to internet radio stations'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/haecker-felix/gradio"
depends=('desktop-file-utils' 'gstreamer' 'gst-plugins-ugly'
'gst-plugins-bad' 'gtk3' 'gobject-introspection' 'gst-plugins-base' 'gst-plugins-good' 'json-glib'
'libgee' 'sqlite3' 'libsoup')
makedepends=('gnome-common' 'meson' 'gettext' 'appstream-glib' 'vala' 'yelp-tools')
options=('!emptydirs')
source=("https://github.com/haecker-felix/${_gitname}/archive/v${pkgver}.tar.gz")
sha256sums=('e52c72b50d12242b98dd716a6c18889873318bb25dcd70fb27b930a5ba451ea2')
conflicts=('gradio-git' 'gradio-bin')
provides=("gradio=${pkgver}")

build() {
	cd "${srcdir}/gradio-${pkgver}"
	meson builddir --prefix=/usr
}

package() {
	cd "${srcdir}/gradio-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
