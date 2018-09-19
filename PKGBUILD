# Maintainer: varris <varris@protonmail.com>
pkgname=krakenx-git
pkgver=v0.0.3.r0.g77eebe9
pkgrel=1
pkgdesc='Python script to control NZXT Kraken X52/X62/X72 coolers'
arch=('any')
url='https://github.com/KsenijaS/krakenx.git'
license=('GPL')
depends=('python' 'python-pyusb')
makedepends=('python-setuptools')
source=('git+https://github.com/KsenijaS/krakenx.git')
md5sums=('SKIP')

pkgver() {
	cd "krakenx"
	git describe --long --tags | sed -r 's/-([0-9]+)-/.r\1./'
}

build() {  
    cd "krakenx"
    python setup.py build
}

package() {
    cd "krakenx"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
