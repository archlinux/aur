# Maintainer: Dustin Willis Webber <dustin.webber@gmail.com>
pkgname=i3-gnome-git
pkgbase=i3-gnome
pkgver=5.1.r2.g55ea56b
pkgrel=1
pkgdesc="Starts i3 inside a gnome session."
arch=("any")
url="https://github.com/TheMarex/i3-gnome"
license=("MIT")
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=("i3-gnome")
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/TheMarex/i3-gnome.git)
noextract=()
md5sums=("SKIP")

pkgver() {
  cd $pkgbase
  git describe --tags --long|sed -r "s,^[^0-9],,;s,([0-9]*-g),r\1,;s,[-_],.,g"
}

build() {
  cd "$pkgbase"

  make
}

package() {
  cd "$pkgbase"

  make DESTDIR="$pkgdir/" install
}
