# Maintainer: Roman Vasilev <2rvasilev@live.ru>
pkgname=yajhfc
pkgver=0.6.0_1
pkgrel=1
pkgdesc="(Yet another Java HylaFAX client) is a client for the HylaFAX fax server written completely in Java."
arch=(any)
url="http://www.yajhfc.de/"
# TODO should _watch be removed?
_watch="http://www.yajhfc.de/downloads/current-version"
license=('GPL3')
groups=()
depends=(java-environment hicolor-icon-theme desktop-file-utils)
makedepends=("pkgextract")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("http://download.yajhfc.de/releases/$pkgname-${pkgver//_/-}.noarch.rpm")
md5sums=('c6c0f417d7f221b7461601d883c6ae25')

build() {
  pkgextract.sh $pkgname-${pkgver//_/-}.noarch.rpm
}

package() {
  rm "$srcdir"/usr/share/$pkgname/lib
  cp -R "$srcdir"/usr "$pkgdir"/
}
md5sums=('7f66c569c395ee21f1ba95f8b3a737a1')
