# Maintainer: Acidhub <dev@acidhub.click>

pkgname=steam-tools-ng
pkgver=0.7
pkgrel=1
pkgdesc="Some useful tools for use with Steam client and some steam related websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools-ng"
depends=('python>=3.7' 'python-aiohttp' 'python-gobject' 'stlib' 'stlib-plugins-git') 
makedepends=('python-setuptools' 'python-certifi')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('d8a99552c1f3b2900359313c737b230bb4a5af5b4478a13ae28a18e217b2b71a')

build() {
    cd $pkgname-$pkgver
    python setup.py build 
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --skip-build --optimize=1 --root=$pkgdir
    install -Dm644 steam-tools-ng.desktop $pkgdir/usr/share/applications/steam-tools-ng.desktop
}


