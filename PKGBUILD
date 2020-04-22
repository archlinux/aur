# Maintainer: TheBitStick <the at bitstick dot rip>
pkgname=nautilus-gnome-disks-git
_pkgname=nautilus-gnome-disks
pkgver=r4.496beb7
pkgrel=1
pkgdesc="Allows you to restore/write/flash a disk image to storage devices using GNOME Disks from Nautilus"
arch=('any')
url="https://github.com/thebitstick/nautilus-gnome-disks"
license=('GPL3')
depends=('python-nautilus' 'gnome-disk-utility')
makedepends=('git')
provides=('nautilus-gnome-disks')
conflicts=('nautilus-gnome-disks')
source=('git+https://github.com/thebitstick/nautilus-gnome-disks')
sha512sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install --mode=644 -D -t "$pkgdir/usr/share/nautilus-python/extensions" "${_pkgname}/nautilus-gnome-disks.py"
} 
