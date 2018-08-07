# Maintainer: Patrick Griffis <tingpign@tingpng.se>

_modname='gbulb'
pkgname='python-gbulb'
pkgver=0.6.0
pkgrel=1
pkgdesc='Implmementation of asyncio using GLib'
arch=('any')
url='https://github.com/nathan-hoad/gbulb'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-gobject')
optdepends=('gtk3: Gtk application integration')
checkdepends=('python-pytest')
source=("https://github.com/nathan-hoad/gbulb/archive/$pkgver.tar.gz")
sha256sums=('465a05a73bf60aec9e491043ddbc74513c284bbc5f6277b8931e805602c9fbf8')

check() {
    cd "$_modname-$pkgver"

    python -m pytest ./tests
}

package() {
    cd "$_modname-$pkgver"

    python ./setup.py install --prefix=/usr --root="$pkgdir" --optimize=2
}
