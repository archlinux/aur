# Maintainer: fft
# Contributor: cyberxndr <cyberxndr@gmail.com>

pkgname=mytetra
pkgver=1.44.160
pkgrel=1
pkgdesc="Personal manager for data memorization and structuring notes"
arch=('x86_64')
url="https://github.com/xintrea/mytetra_dev"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base')
source=("https://github.com/xintrea/mytetra_dev/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('301c297bc359197e07afa2302841a0f7e24c5589ea0b0f5e13b9c2ff6806a562')

build(){
    cd "mytetra_dev-v.${pkgver}"
    qmake
    make
}


package(){
	cd "mytetra_dev-v.${pkgver}/app"
	make install INSTALL_ROOT="${pkgdir}"
	mkdir -p "${pkgdir}/usr/bin/"
	mv "${pkgdir}/mytetra" "${pkgdir}/usr/bin/"
}

