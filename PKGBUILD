pkgname=gnome-shell-extension-media-controls
pkgver=29
pkgrel=1
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
 	cd "$srcdir"
 	cat metadata.json | grep '"version"' | sed 's/[^0-9]*//g'
}

package() {
	cd "$srcdir"
	rm extension.zip

	destdir="$pkgdir/usr/share/gnome-shell/extensions/mediacontrols@cliffniff.github.com/"
	mkdir -p "$destdir"
	install -dm755 "$destdir"

	cp -r * "$destdir/"
}
