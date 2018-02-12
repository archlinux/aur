# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gradio-git
_pkgname=gradio
pkgver=7.1
pkgrel=1
pkgdesc='A GTK3 app for finding and listening to internet radio stations'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/haecker-felix/gradio"
depends=('desktop-file-utils' 'gstreamer' 'gst-plugins-ugly' 'gst-plugins-bad' 
          'gtk3' 'gobject-introspection' 'gst-plugins-base' 'gst-plugins-good' 
          'json-glib' 'libgee' 'sqlite3' 'libsoup')
makedepends=('git' 'gnome-common' 'meson' 'gettext' 'appstream-glib' 'vala' 
              'yelp-tools')
options=('!emptydirs')
source=("git://github.com/haecker-felix/${_pkgname}.git")
md5sums=('SKIP')
conflicts=('gradio' 'gradio-bin')
provides=("gradio=${pkgver}")

build() {
  cd "${srcdir}/${_pkgname}"
  meson builddir --prefix=/usr
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
