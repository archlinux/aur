# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: tkpmonke 
pkgname=implosion
pkgver="0.1.2"
pkgrel=1
epoch=
pkgdesc="A Fast and Powerful FOSS Game Engine"
arch=(x86_64)
url="https://tkpmonke.github.io/Ignition"
license=(custom:ignition)
groups=()
depends=('glfw' 'glew' 'glm' 'assimp' 'p7zip' 'python')
makedepends=('binutils' 'premake')
checkdepends=()
optdepends=()
provides=('ignition' 'ig-imgui' 'preglsl' 'implosion-hub' 'implosion' 'ignition-runtime')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
sha256sums=('cdef4b90e19720fef2267f461196446b4e636477d35018fcec232c9a57a55481')
validpgpkeys=()

_pkgstate="alpha"
_pkgurl="https://github.com/tkpmonke/Ignition/archive/refs/tags"
_pkgext="tar.gz"

source=("$_pkgurl/v$pkgver-$_pkgstate.$_pkgext")

package() {
   install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

prepare() {
	cd "Ignition-$pkgver-$_pkgstate" || exit
   premake5 gmake2
}

build() {
	cd "Ignition-$pkgver-$_pkgstate" || exit
	make
}

install() {
	cd "Ignition-$pkgver-$_pkgstate" || exit
   sudo ./install.sh
}
