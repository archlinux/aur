# Maintainer: Genstar <genstar@disroot.org>
pkgname=pixelvision8-1.0.0-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Open source fantasy game console"
arch=('x86_64')
url="https://pixelvision8.github.io/PixelVision8Website/"
license=('custom:MS-PL')
depends=()
optdepends=()
provides=()
conflicts=()
source=(
'https://github.com/PixelVision8/PixelVision8/releases/download/v1.0.0/PixelVision8-v1.0.0-linux.zip'
'https://raw.githubusercontent.com/PixelVision8/PixelVision8/v1.0.0/LICENSE.txt'
'https://raw.githubusercontent.com/PixelVision8/PixelVision8/v1.0.0/Icon.bmp'
'pixelvision8-100.desktop'
)
md5sums=(
'0ac4759ddf9110e62a3b458f57d34853'
'a0b546798a31051973040a49ae64e8ef'
'cccd96a5667823b9f9b5fa49e53601f4'
'83eda2d1778605bce682620b01cf4db3'
)

package() {
	find 'PixelVision8-v1.0.0-linux/' -type f -exec install -vDm 755 {} "$pkgdir/opt/"{} \;
	install -Dm644 'LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -dm755 "$pkgdir/usr/bin"
	ln -s '/opt/PixelVision8-v1.0.0-linux/Pixel Vision 8' "$pkgdir/usr/bin/pv8-100"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/24x24/apps"
	convert Icon.bmp -sample 24x24 "$pkgdir/usr/share/icons/hicolor/24x24/apps/pixelvision8-100.png"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps"
	convert Icon.bmp -sample 48x48 "$pkgdir/usr/share/icons/hicolor/48x48/apps/pixelvision8-100.png"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/96x96/apps"
	convert Icon.bmp -sample 96x96 "$pkgdir/usr/share/icons/hicolor/96x96/apps/pixelvision8-100.png"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/192x192/apps"
	convert Icon.bmp -sample 192x192 "$pkgdir/usr/share/icons/hicolor/192x192/apps/pixelvision8-100.png"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/16x16/apps"
	convert Icon.bmp -sample 16x16 "$pkgdir/usr/share/icons/hicolor/16x16/apps/pixelvision8-100.png"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	convert Icon.bmp "$pkgdir/usr/share/icons/hicolor/16x16/apps/pixelvision8-100.png"
	install -Dm644 'pixelvision8-100.desktop'  "$pkgdir/usr/share/applications/pixelvision8-100.desktop"
}
