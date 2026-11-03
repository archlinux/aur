# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=todav
_uuid=todav@aperte.dev
pkgname=gnome-shell-extension-todav
pkgver=2.4.3
pkgrel=1
pkgdesc='GNOME Shell companion extension for Todav: tasks, month and agenda in the top bar'
arch=('any')
url='https://github.com/AperteDev/todav'
license=('GPL-3.0-or-later')
depends=('gnome-shell>=1:49' 'todav')
makedepends=('gettext')
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a58cb726e2dd68c4c518cb93ae3cb542985a469c6dea63d0c09437a8f2e40ac')

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
