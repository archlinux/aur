# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=xorgxrdp-git
_gitname=xorgxrdp
pkgver=0.0.0
pkgrel=1
pkgdesc="Xorg drivers for xrdp"
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
#license=('?')
depends=('xrdp')
makedepends=('git' 'nasm' 'xorg-server-devel')
#install=${pkgname}.install
options=(!emptydirs)
source=("git+https://github.com/neutrinolabs/xorgxrdp.git")
md5sums=('SKIP')

build() {
	cd ${_gitname}
	./bootstrap
	./configure
	make
}

package() {
	cd ${_gitname}
	make DESTDIR="${pkgdir}" install
	
	#mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	#cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
