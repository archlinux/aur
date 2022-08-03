# Maintainer: Pranav Jerry <libreinator at disroot dot org>
_basename=pybatmesh
pkgname="$_basename"
pkgver=0.5.3
pkgrel=1
pkgdesc="Python script to create a batman-adv mesh network"
arch=("any")
url="https://git.disroot.org/pranav/${_basename}"
license=("GPL3")
depends=("iwd" "python-dasbus" "systemd>=248" "python-systemd")
optdepends=("batctl: for debugging")
makedepends=("git" "python-setuptools")
replaces=(naxalnet)
provides=($_basename)
conflicts=(naxalnet naxalnet-git $_basename-git)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$_basename"
	make
	return $?
}

package() {
	cd "$srcdir/$_basename"
	make DESTDIR="$pkgdir" install
	return $?
}
