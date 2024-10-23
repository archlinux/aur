# Maintainer: Nathan Reiner <nathan@nathanreiner.xyz>
pkgname=webtray-git
pkgver=70af992
pkgrel=1
pkgdesc="Attach Web-Applications to Tray"
arch=(x86_64)
_tag=70af99261098e1dc951e192d44cee880cfe872ab
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
sha256sums=('45ab062b3caac9690d6a52852b85ac5fee44c098e7638d6b6d3161e42ae7028f')

build() {
  cd "webtray"
  make build
}

package() {
	cd "webtray"
	mkdir -p "$pkgdir/usr/bin/"
	make DESTDIR="$pkgdir/" install
}
