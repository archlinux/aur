# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contributor: lxsycht <lux@systemli.org>

# https://gitlab.com/rmnvgr/metadata-cleaner/-/issues/18
# Drag and drop won't be fixed for a few months. Here is the version where it
# works

pkgname=metadata-cleaner1
_pkgname=metadata-cleaner
pkgdesc='Python GTK application to view and clean metadata in files, using mat2(GTK3 1.x version)'
pkgver=1.0.8
pkgrel=2
provides=("metadata-cleaner=${pkgver}")
conflicts=("metadata-cleaner")
url='https://gitlab.com/rmnvgr/metadata-cleaner'
license=('GPL3')
arch=('x86_64')
depends=('gtk3' 'libhandy' 'python-gobject' 'python' 'mat2')
makedepends=('meson' 'appstream' 'pkgconf')
source=("$_pkgname-v$pkgver.tar.gz"::"$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  meson --prefix=/usr "$_pkgname-v$pkgver" build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

