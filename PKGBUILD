# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=pyocd-pemicro
pkgver=1.1.5
pkgrel=2
pkgdesc="PEMicro probe plugin for pyOCD"
arch=('any')
url="https://github.com/pyocd/pyocd-pemicro"
license=('BSD')
depends=('python-pypemicro'
	 'python-six')
makedepends=('python-build'
	     'python-installer'
	     'python-wheel'
	     'python-setuptools-scm')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('83c5d259d913c4aa7e0fe38d8d913f3f')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

