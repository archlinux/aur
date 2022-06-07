# Maintainer: MaFeLP <mafelp@proton.me>
pkgname='textshine'
pkgver='1.2.0'
pkgrel='1'
pkgdesc='Powerfully transform text'
arch=('x86_64')
url='https://github.com/phase1geo/TextShine'
license=('GPL3')
depends=(
  'glib2'
  'glibc'
  'libgee'
  'granite'
  'gtk3'
  'pango'
  'cairo'
  'libxml2'
  'gtksourceview4'
  'evolution-data-server'
  'libhandy'
  'gtkspell3'
  'discount'
)
makedepends=(
  'vala'
  'python-pip'
  'python-setuptools'
  'meson'
)
source=("TextShine.tar.gz"::"https://github.com/phase1geo/TextShine/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('908fd084cb9731458340205234ff24eda923e7c91fb4e00d233872643294ce9c')

build() {
  cd "TextShine-${pkgver}"
  meson build --prefix=/usr
}

package() {
  cd "TextShine-${pkgver}/build"
  meson install --destdir="${pkgdir}"
}

