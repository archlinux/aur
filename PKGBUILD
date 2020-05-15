# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Acidhub <dev@acidhub.click>

pkgname=steam-tools-ng
pkgver=0.9.4
pkgrel=1
pkgdesc="Some useful tools for use with Steam client and some steam related websites."
arch=('any')
url="https://github.com/ShyPixie/steam-tools-ng"
depends=('python>=3.7' 'python-certifi' 'python-aiohttp' 'python-gobject' 'stlib>=0.12.1' 'stlib-plugins-git')
makedepends=('python-setuptools')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('fc1dd71f0cf764f734a5b2aaff7c5483e280c2b1a0fe944d8e3130df96f854df')

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


