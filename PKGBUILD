# Maintainer: Pranav Jerry <libreinator at disroot dot org>
_basename=naxalnet
pkgname="$_basename"
pkgver=0.2.0
pkgrel=1
pkgdesc="Python script to create a batman-adv mesh network"
arch=("any")
url="https://git.disroot.org/pranav/${_basename}"
license=("GPL3")
depends=("iwd" "python-dasbus" "systemd>=248")
optdepends=("batctl: for debugging")
makedepends=("git" "python-setuptools")
provides=(naxalnet)
conflicts=(naxalnet-git)
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
