# Maintainer: Elia A. <elia@elinvention.ovh>

_pkgname=efibootmgr-gui
pkgname="$_pkgname-git"
pkgver=0.1.r0.g223e42f
pkgrel=1
pkgdesc="Manage EFI boot loader entries with this simple GUI"
url="https://github.com/Elinvention/efibootmgr-gui"
license=('GPL3')
arch=('any')
depends=('python-gobject' 'efibootmgr' 'python3')
makedepends=('git')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm644 "$srcdir/$_pkgname/efibootmgr.desktop" "$pkgdir/usr/share/applications/efibootmgr.desktop"
	install -Dm755 "$srcdir/$_pkgname/efibootmgr_gui.py" "$pkgdir/usr/bin/efibootmgr-gui"
}
