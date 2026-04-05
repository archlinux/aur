# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=gnome-shell-extension-copyous
_uuid='copyous@boerdereinar.dev'
pkgname="$_pkgbase-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc='Modern Clipboard Manager for GNOME'
arch=('any')
url='https://extensions.gnome.org/extension/8834/copyous/'
license=('GPL-3.0')
depends=('gnome-shell' 'libgda6' 'gsound')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase.zip::https://github.com/boerdereinar/copyous/releases/download/v${pkgver}/$_uuid.zip")
sha256sums=('02dd474f0d42a65c63374a42d32e9a06f0880537c8bfaf3e3e671aba5f99ccad')

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	bsdtar -xf "$_pkgbase.zip" -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
