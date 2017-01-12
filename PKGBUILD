# Maintainer: Patrick Griffis <tingpign@tingpng.se>

_modname='gbulb'
pkgname='python-gbulb'
pkgver=0.5
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
sha256sums=('016fb18e6d16fc345bf712e7838bb6fd620e8b5e29b4b10dc17996124033414e')

check() {
    cd "$_modname-$pkgver"

    python -m pytest ./tests
}

package() {
    cd "$_modname-$pkgver"

    python ./setup.py install --prefix=/usr --root="$pkgdir" --optimize=2
}
