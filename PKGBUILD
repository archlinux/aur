# Maintainer: SelfRef <arch@selfref.dev>

_uuid=todav@aperte.dev
pkgname=gnome-shell-extension-todav-bin
pkgver=2.2.0
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
sha256sums=('e3ac754f5d581199039aba57be52549b14a5499ede642b6521507834f55c22ee')

package() {
	local _dest="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	install -d "$_dest"
	bsdtar -xf "$pkgname-$pkgver.zip" -C "$_dest" --no-same-owner
}
