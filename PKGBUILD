# Maintainer: Patrick Griffis <tingpign@tingpng.se>
# Contributor: Sam Day <me@samcday.com>

_modname='gbulb'
pkgname='python-gbulb'
pkgver=0.6.4
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
sha256sums=('f6bae1e2e8288211b6fcbb1aa028191c2b19fe4f0bfae32813581138da6162d2')

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
