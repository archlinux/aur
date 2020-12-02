# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

pkgname=dmenu-dchaovii-git
pkgver=5.0.1
pkgrel=1
epoch=
pkgdesc="Personal Build of dmenu by DChaovII"
arch=(x86_64 i686)
url="https://github.com/DChaovII/dmenu-dchaovii"
license=('MIT')
groups=()
depends=(nerd-fonts-complete)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(dmenu)
conflicts=(dmenu)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd dmenu-dchaovii
	make X11INC=/usr/inculde/X11 X11LIB=/usr/lib/X11
}

package() {
	cd dmenu-dchaovii
        mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}	
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
