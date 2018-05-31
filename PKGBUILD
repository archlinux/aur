# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=quickdocs
pkgver=2.0.3
pkgrel=1
pkgdesc="GTK app for reading Valadoc and DevDocs"
arch=('x86_64')
url="https://github.com/mdh34/quickDocs"
license=('GPL3')
depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'vala' 'webkit2gtk' 'devhelp' 'libarchive')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'meson' 'ninja' 'vala')
options=('!libtool')
source=("https://github.com/mdh34/$pkgname/archive/${pkgver//_/-}.tar.gz")
sha256sums=('cde61c1dbee203143e0e73da4b9d7046e8c322eb08ed1ce40084db9c3847a93b')

build() {
  cd "${srcdir}/quickDocs-${pkgver}"
  arch-meson build
  ninja -C build
}

package() {
  cd "${srcdir}/quickDocs-${pkgver}"
  DESTDIR="${pkgdir}/" ninja -C build install
}
