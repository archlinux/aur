# Maintainer: stas-t (AUR)
# Contributor : zico <zico@dxx-rebirth.com>
# Contributor: Dominic Radermacher <dominic.radermacher@gmail.com>
# Contributor: Star-X (AUR)
# Contributor: SanskritFritz (gmail)

pkgname=d2x-rebirth-bin
pkgver=0.58.1
pkgrel=1
pkgdesc="An enhanced engine to play with Descent2 data (pre-built)."
arch=('x86_64')
url="https://www.dxx-rebirth.com/"
license=('custom:D2x' 'LGPL' 'custom:as-is')
depends=('sdl2' 'sdl2_mixer' 'mesa' 'physfs' 'sdl2_image')
makedepends=('unzip')
provides=('d2x-rebirth')
#conflicts=('d2x-rebirth')
install="$pkgname.install"
source=("https://lutris.net/files/games/dxxrebirth/d2x-rebirth-$pkgver-x86_64.tar.gz"
        "https://www.dxx-rebirth.com/d2x-rebirth_addons.zip"
        "https://raw.githubusercontent.com/dxx-rebirth/dxx-rebirth/refs/heads/master/d2x-rebirth/d2x-rebirth.xpm"
        "https://raw.githubusercontent.com/dxx-rebirth/dxx-rebirth/refs/heads/master/COPYING.txt")
noextract=("d2x-rebirth.xpm" "COPYING.txt")
md5sums=('332b4091d0e26974bead32eebe68da7f'
         '11c338bc1848da4bd58e239e336e59c3'
         '4b5c23ba79561a88b3742fb5e47d9deb'
         '7077769a51d612f2edcc6abd1e5dfa6d')

package() {
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

	install -m755 "d2x-rebirth/d2x-rebirth" "$pkgdir/usr/bin/"

	install -m644 "d2x-rebirth.xpm" "$pkgdir/usr/share/pixmaps/"

	install -m644 "../d2x-rebirth.desktop" "$pkgdir/usr/share/applications/"

	install -m644 "COPYING.txt" "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 "d2x-rebirth addons/d2xr-opl3-music.dxa" "$pkgdir/usr/share/$pkgname/"
	install -m644 "d2x-rebirth addons/d2xr-sc55-music.dxa" "$pkgdir/usr/share/$pkgname/"
	install -m644 "d2x-rebirth addons/editor.dxa" "$pkgdir/usr/share/$pkgname/"
} 

