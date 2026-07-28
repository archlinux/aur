# Maintainer: tommy <t@tommyy.dev>

# Source of truth for the AUR package. pkgver, pkgrel and sha256sums are
# rewritten from the tag by .github/workflows/release.yml, which then pushes
# this file to aur.archlinux.org; edits made in the AUR clone are overwritten.

pkgname=votrim-bin
_pkgname=votrim
pkgver=0.3.0
pkgrel=1
pkgdesc="Native video trimmer and encoder with a multi-segment timeline and live mpv preview"
arch=('x86_64')
url="https://github.com/dowoge/votrim"
license=('GPL-3.0-or-later')
depends=('mpv' 'ffmpeg' 'libglvnd' 'wayland' 'libx11' 'libxcursor' 'libxi'
         'libxrender' 'libxkbcommon' 'libxkbcommon-x11' 'hicolor-icon-theme')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('91326b26549b58f2f59e288e949f83de0366d5c6f06c5be1f34e2a17db4c1045')

package() {
	cd "$_pkgname-$pkgver-x86_64"
	install -Dm755 votrim "$pkgdir/usr/bin/votrim"
	install -Dm644 votrim.desktop "$pkgdir/usr/share/applications/votrim.desktop"
	install -Dm644 votrim.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/votrim.svg"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
