# Contributor: Thomas P. <tpxp@live.fr>
# Maintainer: tee < teeaur at duck dot com >
pkgname=tomboy-ng-bin
pkgver=0.42
pkgrel=1
pkgdesc="A complete rewriting of the Tomboy note taking app. QT6 version"
arch=('x86_64')
license=('MIT')
url="https://wiki.gnome.org/Apps/Tomboy"
depends=(qt6pas pango libnotify hicolor-icon-theme)
makedepends=()
optdepends=()
conflicts=("tomboy-ng")
provides=("tomboy-ng")
replaces=("tomboy-ng")
source=(
  "https://github.com/tomboy-notes/tomboy-ng/releases/download/v${pkgver}/tomboy-ng-${pkgver}-1-Qt6-x86_64.pkg.tar.zst"
)
#  "https://github.com/tomboy-notes/tomboy-ng/releases/download/v${pkgver}/tomboy-ng_${pkgver}-${_srcrel}_amd64.deb"
sha256sums=('967b72b31687cab7af758f25379756c60d3e0a8cdb32c1d7edbe4a1d1beda16f')

package() {

	mkdir -p "$pkgdir/usr/share"
	for dir in man applications icons locale tomboy-ng; do
		cp -r "usr/share/$dir" "$pkgdir/usr/share"
	done

	install -Dm755 "usr/bin/tomboy-ng" "$pkgdir/usr/bin/tomboy-ng"
}
