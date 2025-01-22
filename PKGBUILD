# Maintainer: Nathan Reiner <nathan@nathanreiner.xyz>
pkgname=webtray-git
pkgver=34c9a7b
pkgrel=1
pkgdesc="Attach Web-Applications to Tray"
arch=(x86_64)
_tag=34c9a7b64c09ad5c699d633346621fcb2e987eb6
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
sha256sums=('74aeb353f6bf7e6c547d4c32b9819ee2ebe8e582c32b8823af5339c1b128edcc')

build() {
  cd "webtray"
  make build
}

package() {
	cd "webtray"
	mkdir -p "$pkgdir/usr/bin/"
	make DESTDIR="$pkgdir/" install
}
