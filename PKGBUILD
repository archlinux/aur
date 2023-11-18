pkgname=gnome-shell-extension-media-controls
pkgver=28
pkgrel=2
pkgdesc="A media indicator for the GNOME shell"
arch=('any')
url="https://github.com/cliffniff/media-controls"
license=('MIT')
makedepends=()
depends=('gnome-shell')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=("https://github.com/sakithb/media-controls/releases/latest/download/extension.zip")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --abbrev=0 | sed 's/^v\(.*\)/\1/'
}

package() {
	destdir="$pkgdir/usr/share/gnome-shell/extensions/mediacontrols@cliffniff.github.com/"
	mkdir -p "$destdir"
	install -dm755 "$destdir"

	cp -r "$srcdir" "$destdir"
}
