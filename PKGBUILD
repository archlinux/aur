# Maintainer: stas-t (AUR)
# Contributor : zico <zico@dxx-rebirth.com>
# Contributor: Dominic Radermacher <dominic.radermacher@gmail.com>
# Contributor: Star-X (AUR)
# Contributor: SanskritFritz (gmail)

pkgname_=d1x-rebirth
pkgname=${pkgname_}-bin
pkgver=0.58.1
pkgrel=1
pkgdesc="An enhanced engine to play with Descent1 data (pre-built)."
arch=('x86_64')
url="https://www.dxx-rebirth.com/"
license=('custom:D2x' 'LGPL' 'custom:as-is')
depends=('sdl2' 'sdl2_mixer' 'mesa' 'physfs' 'sdl2_image')
makedepends=('unzip')
provides=('d1x-rebirth')
conflicts=('d1x-rebirth')
install="$pkgname.install"
source=("https://lutris.net/files/games/dxxrebirth/d1x-rebirth-$pkgver-x86_64.tar.gz"
        "https://www.dxx-rebirth.com/d1x-rebirth_addons.zip"
        "https://raw.githubusercontent.com/dxx-rebirth/dxx-rebirth/refs/heads/master/d1x-rebirth/d1x-rebirth.xpm"
        "https://raw.githubusercontent.com/dxx-rebirth/dxx-rebirth/refs/heads/master/COPYING.txt")
noextract=("d1x-rebirth.xpm" "COPYING.txt")
md5sums=('0117f7ce8565783e8aa1ffffc1e141b1'
         'b1041f45a99961638b39dc5088ca7d06'
         '27acb4397b62092ff5931d72fd1f1c0b'
         '7077769a51d612f2edcc6abd1e5dfa6d')

package() {
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/$pkgname_"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

	install -m755 "d1x-rebirth/d1x-rebirth" "$pkgdir/usr/bin/"

	install -m644 "d1x-rebirth.xpm" "$pkgdir/usr/share/pixmaps/"

	install -m644 "../d1x-rebirth.desktop" "$pkgdir/usr/share/applications/"

	install -m644 "COPYING.txt" "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 "d1x-rebirth addons/d1xr-mac-demo-sounds.dxa" "$pkgdir/usr/share/$pkgname_/"
	install -m644 "d1x-rebirth addons/d1xr-hires.dxa" "$pkgdir/usr/share/$pkgname_/"
	install -m644 "d1x-rebirth addons/editor.dxa" "$pkgdir/usr/share/$pkgname_/"
	install -m644 "d1x-rebirth addons/d1xr-sc55-music.dxa" "$pkgdir/usr/share/$pkgname_/"
	install -m644 "d1x-rebirth addons/d1xr-opl3-music.dxa" "$pkgdir/usr/share/$pkgname_/"
} 

