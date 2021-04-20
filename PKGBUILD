# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=plank-docklet-tea
pkgver=1.0.0
pkgrel=1
pkgdesc=" A tea timer docklet for plank / docky."
arch=("x86_64")
url="https://github.com/hannenz/tea"
license=("Unknown")
depends=("plank")
makedepends=("cmake" "vala")
source=("$pkgname-$pkgver.zip::$url/archive/refs/heads/master.zip")
md5sums=("SKIP")

build() {
  cd "tea-master"
  make
}

package() {
  cd "tea-master"

  install -D libdocklet-tea.so $pkgdir/usr/lib/plank/docklets/libdocklet-tea.so
  install -D de.hannenz.tea.gschema.xml $pkgdir/usr/share/glib-2.0/schemas/de.hannenz.tea.gschema.xml
}
