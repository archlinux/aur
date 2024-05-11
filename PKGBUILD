# Maintainer: Nathan Reiner <nathan@nathanreiner.xyz>
pkgname=webtray-git
pkgver=c1c4472
pkgrel=1
pkgdesc="Attach Web-Applications to Tray"
arch=(x86_64)
_tag=c1c4472567a8fa3f73b4372854c110c449e2dbdc
url="https://git.nathanreiner.xyz/webtray"
license=('GPL')
groups=()
depends=(qt6-webengine)
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
sha256sums=('7d3cb5d0940d664b972020974d8d7d14c2b8b50e181f1b35d8351f82dd2cbe79')

build() {
  cd "webtray"
  make build
}

package() {
	cd "webtray"
	mkdir -p "$pkgdir/usr/bin/"
	make DESTDIR="$pkgdir/" install
}
