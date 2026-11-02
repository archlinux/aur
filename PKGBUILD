# Maintainer: SelfRef <arch@selfref.dev>

_uuid=todav@aperte.dev
pkgname=gnome-shell-extension-todav-bin
pkgver=2.4.2
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
sha256sums=('4420b122cf5b0f5bc1ab9b636c25029d12e66890b8e6fffed88243aa129f1c55')

package() {
	local _dest="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	install -d "$_dest"
	bsdtar -xf "$pkgname-$pkgver.zip" -C "$_dest" --no-same-owner
}
