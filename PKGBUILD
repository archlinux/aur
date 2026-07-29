# Maintainer: nicknb <nicknb at posteo dot com>
# Contributor: Haoyang Liu <tttturtleruss@gmail.com>
# Contributor: m8D2 <omui (at) proton mail (dot) com>
# Contributor: novenary <streetwalkermc@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-soco
pkgver=0.31.2
pkgrel=1
pkgdesc="A Python library that allows you to control Sonos speakers programmatically"
arch=('any')
url="https://github.com/SoCo/SoCo"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
depends=('python' 'python-requests' 'python-xmltodict' 'python-ifaddr'
         'python-twisted' 'python-aiohttp' 'python-appdirs' 'python-lxml')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("SoCo-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a8c0eb3f7b48d4d317958f5840f033101e5c1d95fc4d288defbbff7a1c373bd3')

build() {
    cd SoCo-$pkgver
    python3 -m build --wheel --no-isolation
}

package() {
    cd SoCo-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.rst
}
