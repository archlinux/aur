# Maintainer: Patrick Griffis <tingpign@tingpng.se>
# Contributor: Sam Day <me@samcday.com>

_modname='gbulb'
pkgname='python-gbulb'
pkgver=0.6.2
pkgrel=1
pkgdesc='Implementation of asyncio using GLib'
arch=('any')
url='https://github.com/nathan-hoad/gbulb'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-gobject')
optdepends=('gtk3: Gtk application integration')
checkdepends=('python-tox')
source=("https://github.com/beeware/gbulb/archive/v$pkgver.tar.gz")
sha256sums=('e35a01f6779a87c682e5f3e6b7bc7f65815330fc3c15f7c648a32ddb286dc973')

prepare() {
    cd "$_modname-$pkgver"
}

check() {
    cd "$_modname-$pkgver"
    tox -e py
}

package() {
    cd "$_modname-$pkgver"

    python ./setup.py install --prefix=/usr --root="$pkgdir" --optimize=2
}
