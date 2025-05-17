# Maintainer:
# Contributor: Sematre <sematre at gmx dot de>

_pkgname="discimagecreator"
pkgname="$_pkgname"
pkgver=20250501
pkgrel=1
pkgdesc="A disk image creation tool supporting a large number of formats"
url="https://github.com/saramibreak/DiscImageCreator"
license=('Apache-2.0')
arch=('x86_64')

depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'git'
  'meson'
  'ninja'
)
optdepends=(
  'unscrambler: Unscramble GC/Wii optical disks'
)

_pkgsrc="DiscImageCreator-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext")
sha256sums=('21579a4b18c7d3272be9655d989094ef8db4b682906b6a9d387853c74a9a4821')

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
