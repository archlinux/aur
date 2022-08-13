# Maintainer: khhs khhs1671@gmail.com

pkgname="libmemstack-git"
pkgver="1.1.0"
pkgrel="0"
pkgdesc="A small lib for managing memory"
arch=("x86_64" "arm")
depends=("make" "gcc")
license=("custom")
source=()
sha512sums=()
conflicts=("libmemstack")
package() {
	if [[ -d "memstack" ]]; then 
		rm -rf memstack
	fi
	git clone https://github.com/Khhs167/memstack.git
	mkdir -p "${pkgdir}/usr/lib"
	mkdir -p "${pkgdir}/usr/include"
	make --directory=memstack install INSTALL_PATH="${pkgdir}/usr"
}

