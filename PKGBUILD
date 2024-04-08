# Maintainer: Tomás Duarte <tomas@mustachedsquid.com>
_pkgname=pacman-zfs-hook
pkgname=${_pkgname}-git
pkgver=r1.e1b097a
pkgrel=2
pkgdesc="Pacman ZFS Hook to create ZFS Snapshots on Pacman transactions."
arch=('x86_64')
url="https://github.com/RileyInkTheCat/Pacman-ZFS-Hook"
license=('BSD')
depends=('bash' 'pacman')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}
