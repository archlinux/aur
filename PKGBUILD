# Maintainer: Acidhub <dev@acidhub.click>

pkgname=steam-tools-ng
pkgver=0.9.1
pkgrel=1
pkgdesc="Some useful tools for use with Steam client and some steam related websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools-ng"
depends=('python>=3.7' 'python-certifi' 'python-aiohttp' 'python-gobject' 'stlib>=0.12' 'stlib-plugins-git') 
makedepends=('python-setuptools')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('dab78db4d31aa7453274fc8f3d1a7e46e40a39f68523f6bbbad0055ea6fbc8bb')

build() {
    cd $pkgname-$pkgver
    python setup.py build 
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --skip-build --optimize=1 --root=$pkgdir
    install -Dm644 steam-tools-ng.desktop $pkgdir/usr/share/applications/steam-tools-ng.desktop
    cp -rf icons/* $pkgdir/usr/share/steam-tools-ng/icons/
}


