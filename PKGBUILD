# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

_pkgbase=nemo-extensions
pkgname=nemo-preview
pkgver=6.6.0
pkgrel=3
pkgdesc='Quick file previewer for Nemo'
arch=(x86_64)
url='https://github.com/linuxmint/nemo-extensions'
license=(GPL-2.0-or-later)
depends=(
  bash
  cairo
  cjs
  clutter
  clutter-gst
  clutter-gtk
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-base-libs
  gstreamer
  gtk3
  gtksourceview4
  libgirepository
  libmusicbrainz5
  libx11
  pango
  webkit2gtk-4.1
  xreader
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  meson
)
optdepends=('cinnamon-translations: i18n')
source=("git+https://github.com/linuxmint/nemo-extensions.git#tag=$pkgver")
b2sums=(e3803f0d9254a663576c532e0dbdc08e29eac625ee18274725acdf37f73a1757f557b1bb6452a1f2578ac4c48017e919123ae9c36c117e5e917a81538b4f2d84)

build() {
  cd $_pkgbase/$pkgname
  arch-meson . build \
    --libexecdir=lib/$_dir
}

package(){
  cd $_pkgbase/$pkgname
  meson install -C build --destdir="$pkgdir"
}
