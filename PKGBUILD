# Maintainer: Roman Vasilev <2rvasilev@live.ru>
pkgname=yajhfc
pkgver=0.6.1_1
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
optdepends=("yajhfc-pdf-plugin: PDF support plugin")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("http://download.yajhfc.de/releases/$pkgname-${pkgver//_/-}.noarch.rpm")
md5sums=('ff8f70ba83c0822a5754db241d2ad18a')

build() {
  pkgextract.sh $pkgname-${pkgver//_/-}.noarch.rpm
}

package() {
  rm "$srcdir"/usr/share/$pkgname/lib
  cp -R "$srcdir"/usr "$pkgdir"/
}
