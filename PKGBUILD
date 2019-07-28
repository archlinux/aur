# Maintainer: Lauri Gustafsson <luutifa at gmail dot com>

_pkgbase="rocket"
pkgbase="$_pkgbase-git"
pkgname=("$_pkgbase-git")
pkgver=r784.f28e2a0
pkgrel=1
pkgdesc="An intuitive sync-tracker tool for realtime audiovisual productions"
arch=("i686" "x86_64")
url="https://github.com/rocket/rocket"
license=("custom")
makedepends=("git" "qt5-base")
source=("$_pkgbase::git+https://github.com/rocket/rocket")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir"/"$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

#prepare() {
#}

build() {
  cd "$srcdir"/"$_pkgbase"
  make
}

#check() {
#}

package_rocket-git() {
  depends=("qt5-base")
  install -d "$pkgdir"/usr/lib/"$_pkgbase"
  install -d "$pkgdir"/usr/include/"$_pkgbase"
  cp "$srcdir"/"$_pkgbase"/lib/*.a "$pkgdir"/usr/lib
  cp "$srcdir"/"$_pkgbase"/lib/*.c "$pkgdir"/usr/lib/"$_pkgbase"
  cp "$srcdir"/"$_pkgbase"/lib/*.h "$pkgdir"/usr/lib/"$_pkgbase"
  cp "$srcdir"/"$_pkgbase"/lib/sync.h "$pkgdir"/usr/include/"$_pkgbase"
  install -Dm755 "$srcdir"/"$_pkgbase"/editor/editor "$pkgdir"/usr/bin/"$_pkgbase"
}

