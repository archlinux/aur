# Maintainer: Hiasinsu <hiasinsu@hotmail.com>

pkgname=utsu-bin
_debname=utsu
_debarch=amd64
pkgver=0.4.4
pkgrel=1
pkgdesc="A cross-platform vocal synthesis frontend"
arch=('x86_64')
url="https://github.com/titinko/utsu"
license=('custom')
groups=()
depends=('alsa-lib' 'libbsd' 'freetype2' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxi' 'libxrender' 'libxtst' 'xdg-utils' 'zlib')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=('utsu')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/titinko/utsu/releases/download/v${pkgver}/${_debname}_${pkgver}_${_debarch}.deb")
noextract=("utsu_${pkgver}_${_debarch}.deb")
md5sums=('866374f2a14fbd3d67426dff1cb965b8')
validpgpkeys=()

prepare() {
	ar -x ${_debname}_${pkgver}_${_debarch}.deb
	mkdir -p ${_debname}-${pkgver}_${pkgrel}
	tar -xf data.tar.xz --directory="${_debname}-${pkgver}_${pkgrel}"
}

package() {
	cd "${_debname}-${pkgver}_${pkgrel}"
	cp -r ./ ${pkgdir}/
	cd ${pkgdir}
	install -Dm644 ./opt/utsu/lib/utsu-Utsu.desktop ./usr/share/applications/utsu-Utsu.desktop
	install -Dm644 ./opt/utsu/lib/app/LICENSE ./usr/share/licenses/${pkgname}/LICENSE
}
