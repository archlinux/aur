# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sathya Pramodh <sathyapramodh17@gmail.com>
pkgname=resetti
_pkgdir="/usr/bin"
_devbranch="next"
pkgver=0.4.0_devel
pkgrel=1
pkgdesc="resetti is a Linux-compatible reset macro for Minecraft speedruns. It supports
a variety of different resetting styles, categories, and Minecraft versions."
arch=('x86_64' 'i686')
url="https://www.github.com/woofdoggo/resetti"
license=('GPL3')
groups=()
depends=()
makedepends=('go' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+$url#branch=$_devbranch")
noextract=()
md5sums=('SKIP')
validategpgkeys=()

pkgver(){
	echo $(cat ${pkgname}/.version)_devel
}

build() {
	cd "$pkgname"
	make build
}

package() {
	cd "$pkgname"
	cp resetti $_pkgdir
	cp -p bench ${pkgdir}/$XDG_CONFIG_HOME/resetti
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
