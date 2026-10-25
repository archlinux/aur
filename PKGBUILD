# Maintainer: SelfRef <arch@selfref.dev>

_uuid=todav@aperte.dev
pkgname=gnome-shell-extension-todav-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='GNOME Shell companion extension for Todav: tasks, month and agenda in the top bar'
arch=('any')
url='https://github.com/AperteDev/todav'
license=('GPL-3.0-or-later')
depends=('gnome-shell>=1:49' 'todav')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_uuid.shell-extension.zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('5fad36bfcafd75255facbb412694d083b0dfe55bd4ea1230b6b2e160bfd5b743')

package() {
	local _dest="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	install -d "$_dest"
	bsdtar -xf "$pkgname-$pkgver.zip" -C "$_dest" --no-same-owner
}
