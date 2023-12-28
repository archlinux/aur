# Maintainer: Bitals <me at bitals dot xyz>\
pkgname=docker-autocompose
pkgver=1.1
pkgrel=1
pkgdesc='Generate a docker-compose yaml definition from a running container'
arch=('any')
url='https://github.com/Red5d/docker-autocompose'
license=('unknown')
depends=(
    'python-pyaml>=20.4.0'
    'python-docker>=4.4.4'
    'python-six>=1.16.0'
)
conflicts=('docker-autocompose-git')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Red5d/docker-autocompose/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('d325c4854e6141b7a7f4e87ef9d5b670223136e59a405db070dd6af545fea9dde2beb211f5a68d43884fe9907ec932d340536e8db802878249891dc9440ac2a7')

package() {
    cd "$srcdir"/"$pkgname"-"$pkgver" || exit
    python setup.py install --root "$pkgdir" --optimize=1
}
