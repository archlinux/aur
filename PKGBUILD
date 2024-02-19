# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: rabenklau <rabenklau@gmail.com>
pkgname=fortune-mod-xkcdb
pkgver=2024.02.19
pkgrel=1
epoch=
pkgdesc="fortune file with #xkcd quotes taken from xkcdb.com"
arch=('any')
url="xkcdb.com"
license=('MIT')
groups=(fortune-mods)
depends=(fortune-mod)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://raw.githubusercontent.com/rabe-/fortune-mod-xkcdb/main/xkcdb.txt")
noextract=()
sha256sums=('5436659054dfe258747a9b8bc3bacca6047e421dbd19aa5decd0bfa882c80937')
validpgpkeys=()

build() {
  if true; then # change true to false to have pure ASCII quotes
    cp "${srcdir}/xkcdb.txt" "${srcdir}/xkcdb"
  else
    sed "s/’/'/g; s/é/e/g; s/è/e/g;" "${srcdir}/xkcdb.txt" > "${srcdir}/xkcdb"
  fi
  strfile "${srcdir}/xkcdb" "${srcdir}/xkcdb.dat"
}

package() {
  install -D -m644 "${srcdir}/xkcdb" "${pkgdir}/usr/share/fortune/off/xkcdb"
  install -D -m644 "${srcdir}/xkcdb.dat" "${pkgdir}/usr/share/fortune/off/xkcdb.dat"
}













