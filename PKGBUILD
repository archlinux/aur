# Maintainer: Jacob Kauffmann <jacob@system76.com>
_basename=cosmic-applet-host
pkgname=cosmic-applet-host-git
pkgver=r28.b550074
pkgrel=1
epoch=
pkgdesc="Applet host for COSMIC DE"
arch=(x86_64 aarch64)
url="https://github.com/pop-os/cosmic-applet-host"
license=('MPL-2.0')
groups=()
depends=()
makedepends=(git rust)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("cosmic-applet-host::git+https://github.com/pop-os/cosmic-applet-host#branch=master_jammy")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
