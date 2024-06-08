pkgname=xeyes-git
pkgver=1.00
pkgrel=1
epoch=
pkgdesc="A 'follow the mouse' X demo, using the X SHAPE extension"
arch=(x86_64 arm)
url="https://gitlab.freedesktop.org/xorg/app/xeyes.git"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
	cd "xeyes"
	./autogen.sh
        make       
}

package() {
	cd "xeyes"
	install -Dm755 xeyes "${pkgdir}/usr/local/bin/xeyes"
        install -Dm644 README.md "${pkgdir}/usr/share/xeyes/README.md"
        install -Dm644 COPYING "${pkgdir}/usr/share/xeyes/COPYING"
}
