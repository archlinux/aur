# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=deepin-crossover
pkgver=0.5.14
pkgrel=1
epoch=
pkgdesc="Deepin CrossOver."
arch=('i686' 'x86_64')
url="https://www.codeweavers.com/"
license=('unknown')
groups=()
depends=('lib32-libx11')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/d/${pkgname}/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('c5f59fd1d4ed2b1df597e0d4290fbbaf')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgver}_i386.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
	cd ${pkgname}-${pkgver}
	mv ./lib ./usr/
	rm -rf ./lib	
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
}
