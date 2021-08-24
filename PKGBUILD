# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>
pkgname=python-spiceypy
pkgver=4.0.2
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N66) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy"
license=('MIT')
makedepends=('python-numpy')
depends=('python-numpy')
optdepends=('python-pytest: testing' 'python-pandas: testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
sha512sums=('b77e04c5f717ad1b822ff5492863d1b37621af34c8333bf15973e40de2e147099d84a4fee4c125c5a5bd72046436333d79e4135c74ade24a8b3e0982914682d5')

build() {

    cd SpiceyPy-$pkgver

    python setup.py build

}

package() {

    cd SpiceyPy-$pkgver

    python setup.py install --skip-build --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
