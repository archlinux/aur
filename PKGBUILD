# Maintainer: elforo <git@lforchini.com>

pkgname=minifox-bin
pkgver=0.14
pkgrel=1
pkgdesc="A client for the Fox Weiqi Server"
arch=('x86_64')
url="https://openfoxwq.github.io/"
license=('custom:nonfree')
depends=('bash' 'glibc' 'gcc-libs' 'libx11' 'libglvnd' 'libpng')
source=(
	"https://github.com/openfoxwq/openfoxwq.github.io/releases/download/v$pkgver/minifox-v$pkgver-linux.zip"
	"minifox.sh"
	"minifox.desktop"
	"icon.png")
sha256sums=(
	'6ad0f61c8a9963e123051a7ec2b01fd8ac0b7b297bfe6a6b17e75266a988aa27'
	'57556f6a07ebeb16cf408e433a1c77646ed8add518b2d02bff09b72b59783dd7'
	'0fa02fc495afb200d0eb919f1f63c9619cf4bc6f919c206264615d3cd7477d2d'
	'9752e83fd9b96d0897173922a9507fc4c92be4583279b390d31decb184931314')

package() {
	install -d "$pkgdir/opt/minifox"

	cp -r "$srcdir/asset" "$pkgdir/opt/minifox/asset"
	cp -r "$srcdir/minifox" "$pkgdir/opt/minifox/minifox"
	chmod -R +r "$pkgdir/opt/minifox/asset"
	chmod +x "$pkgdir/opt/minifox/minifox"

	install -Dm755 "$srcdir/minifox.sh" "$pkgdir/usr/bin/minifox"
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/minifox.png"
	install -Dm644 "$srcdir/minifox.desktop" -t "$pkgdir/usr/share/applications"
}
