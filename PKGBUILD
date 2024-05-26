# Maintainer: Nathan Reiner <nathan@nathanreiner.xyz>
pkgname=webtray-git
pkgver=8e7551e
pkgrel=1
pkgdesc="Attach Web-Applications to Tray"
arch=(x86_64)
_tag=8e7551e9fe64012b3c7ca3f643fb780d9b30dbd9
url="https://git.nathanreiner.xyz/webtray"
license=('GPL')
groups=()
depends=(qt6-webengine imagemagick)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+${url}#tag=${_tag})
noextract=()
sha256sums=('8f30cbafcd6da1919ee142ac41fb961f065a6ce8081e8811823c4978b3d1738d')

build() {
  cd "webtray"
  make build
}

package() {
	cd "webtray"
	mkdir -p "$pkgdir/usr/bin/"
	make DESTDIR="$pkgdir/" install
}
