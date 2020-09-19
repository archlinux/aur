# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pyepsg
pkgver=0.4.0
pkgrel=1
pkgdesc='A simple interface to https://epsg.io/'
url='https://github.com/rhattersley/pyepsg'
arch=('any')
license=('LGPL3')
depends=('python-requests')
makedepends=('python-setuptools')

source=(
  "https://files.pythonhosted.org/packages/source/p/pyepsg/pyepsg-$pkgver.tar.gz"
)
sha256sums=(
  '2d08fad1e7a8b47a90a4e43da485ba95705923425aefc4e2a3efa540dbd470d7'
)

build() {
    cd "pyepsg-$pkgver"
    python setup.py build
}

package() {
    cd "pyepsg-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
