# Maintainer: Pranav Jerry <libreinator at disroot dot org>
_basename=naxalnet
pkgname="$_basename-git"
pkgver=r29.55a5444
pkgrel=1
pkgdesc="Python script to create a batman-adv mesh network"
arch=("any")
url="https://git.disroot.org/pranav/$_basename"
license=("GPL3")
depends=("iwd" "python-dasbus" "systemd>=248")
optdepends=("batctl: for debugging")
makedepends=(git)
provides=(naxalnet)
source=("git+https://git.disroot.org/pranav/$_basename.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_basename"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_basename"
	make DESTDIR="$pkgdir/" install
	return $?
}
