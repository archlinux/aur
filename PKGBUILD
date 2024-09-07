# Maintainer:
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

## links
# https://docs.xfce.org/apps/gigolo/start
# https://gitlab.xfce.org/apps/gigolo

_pkgname=gigolo
pkgname="$_pkgname"
pkgver=0.5.3
pkgrel=1
pkgdesc="Frontend to manage connections to remote filesystems using GIO/GVFS"
url="https://gitlab.xfce.org/apps/gigolo"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'gtk3'
  'gvfs'
)
makedepends=(
  'intltool'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.bz2"
source=("$_pkgsrc.$_pkgext"::"https://archive.xfce.org/src/apps/gigolo/${pkgver::3}/$_pkgsrc.$_pkgext")
sha256sums=('d25984f65744665e2433335249f9547a38cead45440027af0c397ebf254d2fd0')

build() {
  cd "$_pkgsrc"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
}
