# Maintainer: Niklas20114552 <niklas.deppermann@outlook.com>
pkgname="otf-material-design-icons"
pkgver=44.0.00
pkgrel=1
pkgdesc="Font with every Material Icons"
arch=(any)
license=('MIT')
url="https://github.com/google/material-icons-font"
source=()
sha256sums=('SKIP')
depends=()
makedepends=('wget')

package() {
	MYTMPDIR=$(mktemp -d -p ~)
	wget --output-document="$MYTMPDIR/MaterialIconsOutlined-Regular.otf" "https://github.com/google/material-design-icons/raw/master/font/MaterialIconsOutlined-Regular.otf"
	wget --output-document="$MYTMPDIR/MaterialIconsSharp-Regular.otf" "https://github.com/google/material-design-icons/raw/master/font/MaterialIconsSharp-Regular.otf"
	wget --output-document="$MYTMPDIR/MaterialIconsRound-Regular.otf" "https://github.com/google/material-design-icons/raw/master/font/MaterialIconsRound-Regular.otf"
	wget --output-document="$MYTMPDIR/MaterialIconsTwoTone-Regular.otf" "https://github.com/google/material-design-icons/raw/master/font/MaterialIconsTwoTone-Regular.otf"
	wget --output-document="$MYTMPDIR/MaterialIcons-Regular.ttf" "https://github.com/google/material-design-icons/raw/master/font/MaterialIcons-Regular.ttf"

	install -Dm644 "$MYTMPDIR/MaterialIconsOutlined-Regular.otf" ${pkgdir}/usr/share/fonts/MaterialIconsOutlined-Regular.otf
	install -Dm644 "$MYTMPDIR/MaterialIconsSharp-Regular.otf" ${pkgdir}/usr/share/fonts/MaterialIconsSharp-Regular.otf
	install -Dm644 "$MYTMPDIR/MaterialIconsRound-Regular.otf" ${pkgdir}/usr/share/fonts/MaterialIconsRound-Regular.otf
	install -Dm644 "$MYTMPDIR/MaterialIconsTwoTone-Regular.otf" ${pkgdir}/usr/share/fonts/MaterialIconsTwoTone-Regular.otf
	install -Dm644 "$MYTMPDIR/MaterialIcons-Regular.ttf" ${pkgdir}/usr/share/fonts/MaterialIcons-Regular.ttf

	rm -rf "$MYTMPDIR"
}
