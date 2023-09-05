# Maintainer: Florian Schweiger <mpkmpoza@duck.com>
upstream_name=actions-for-nautilus
pkgname="$upstream_name-git"
pkgver=v1.6.1_1_g1d38628
pkgrel=1
pkgdesc='Nautilus extension to add arbitrary actions to the file selection context menu'
arch=('x86_64')
url='https://github.com/bassmanitram/actions-for-nautilus'
license=('Apache')
depends=('nautilus' 'python-nautilus' 'python-gobject' 'procps-ng' 'jquery')
makedepends=('git')
optdepends=()
provides=()
conflicts=('filemanager-actions')
backup=("~/.local/share/actions-for-nautilus/config.json")
options=()
install=
changelog=
source=('git+https://github.com/bassmanitram/actions-for-nautilus.git')
noextract=()
sha256sums=('SKIP')
pkgver() {
	cd "$upstream_name"
	git describe --tags | tr - _
}
package() {
	cd "$upstream_name"
	make DESTDIR="$pkgdir/" install
}
