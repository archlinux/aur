# Maintainer: SelfRef <arch@selfref.dev>

_uuid=todav@selfref.dev
pkgname=gnome-shell-extension-todav-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='GNOME Shell companion extension for Todav: tasks, month and agenda in the top bar'
arch=('any')
url='https://github.com/SelfRef/todav'
license=('GPL-3.0-or-later')
depends=('gnome-shell>=1:49' 'todav')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_uuid.shell-extension.zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('6da4f55b083d658bdaf89def3ddeb839e7541841f6d50cfd2c442647a21c6d21')

package() {
	local _dest="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	install -d "$_dest"
	bsdtar -xf "$pkgname-$pkgver.zip" -C "$_dest" --no-same-owner
}
