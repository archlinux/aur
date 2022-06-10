# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-epc
pkgver=0.0.5
pkgrel=4
pkgdesc="EPC (RPC stack for Emacs Lisp) for Python"
arch=('any')
url="https://github.com/tkf/python-epc"
license=('GPL3')
depends=('python-sexpdata')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e70e619efd25f2cbe44dfad4ac5613475eca0ad374b2a451b12969ffad705eeb')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
