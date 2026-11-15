# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=todav
_uuid=todav@aperte.dev
pkgname=gnome-shell-extension-todav
pkgver=2.8.2
pkgrel=1
pkgdesc='GNOME Shell companion extension for Todav: tasks, month and agenda in the top bar'
arch=('any')
url='https://github.com/AperteDev/todav'
license=('GPL-3.0-or-later')
depends=('gnome-shell>=1:49' 'todav')
makedepends=('gettext')
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2728a78d227e77a6b5cc4e6ec11abd5242070ad3f4d0bf3acba743a02d406824')

build() {
	cd "$_pkgbase-$pkgver"
	make -C todav/gnome-extension stage
}

package() {
	cd "$_pkgbase-$pkgver/target/extension"
	local _dest="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	install -d "$_dest"
	cp -r --no-preserve=ownership . "$_dest"
}
