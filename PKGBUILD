# Maintainer: varris <varris@protonmail.com>
pkgname=krakenx-git
pkgver=efded76
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
    git rev-parse --short HEAD
}

build() {  
    cd "krakenx"
    python setup.py build
}

package() {
    cd "krakenx"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
