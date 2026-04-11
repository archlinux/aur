# Maintainer: Cainan Mahar <maharcainan@gmail.com>
pkgname=bambootracker-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="A music tracker for the Yamaha YM2608 (OPNA) sound chip"
arch=('x86_64')
url="https://bambootracker.github.io/BambooTracker/"
license=('GPL2')
depends=('qt5-base' 'bash' 'hicolor-icon-theme')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/BambooTracker/BambooTracker/releases/download/v${pkgver}/BambooTracker-v${pkgver}-linux-64bit.zip")
md5sums=('d3cd504e18ef0201f5a99254b5d7c7f2')

package() {
	cd "BambooTracker-v${pkgver}-linux-64bit"
	install -m 755 -Dt "${pkgdir}/usr/bin" bin/*
    	cp -dr --preserve=mode,timestamp share "${pkgdir}/usr/share" 
}
