# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=quickdocs
pkgver=2.2.3
pkgrel=1
pkgdesc="GTK app for reading Valadoc and DevDocs"
arch=('x86_64')
url="https://github.com/mdh34/quickDocs"
license=('GPL3')
depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'vala' 'webkit2gtk' 'devhelp' 'libarchive')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'meson' 'ninja' 'vala')
options=('!libtool')
source=("https://github.com/mdh34/$pkgname/archive/${pkgver//_/-}.tar.gz")
sha256sums=('87bd99ef6902092a49ce5532b687664eabc6e88018df188eb132b6e45977f31d')

build() {
  cd "${srcdir}/quickDocs-${pkgver}"
  arch-meson build
  ninja -C build
}

package() {
  cd "${srcdir}/quickDocs-${pkgver}"
  DESTDIR="${pkgdir}/" ninja -C build install
}
