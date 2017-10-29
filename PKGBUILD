# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gradio
_gitname=gradio
pkgver=6.0.2
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
sha256sums=('941b8abea901699f3110894ada34c74a51df518c6b83ea6cd237ffcac18e2092')
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
