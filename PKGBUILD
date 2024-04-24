# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
_pkgname=cmcrameri
pkgname=python-${_pkgname}
pkgver=1.9
pkgrel=1
pkgdesc="A wrapper around Fabio Crameri's perceptually uniform colourmaps for geosciences."
arch=('any')
url="https://github.com/callumrollo/${_pkgname}/"
license=('MIT')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer')
depends=('python-numpy' 'python-matplotlib')
source=("git+${url}#tag=v${pkgver}")
sha512sums=('e725218782fa44c96ab962ab788a4f171e746afc098cdc1331fd776d00045d8fb590cbb8eed1bb011413f7f08520f44b7dfd9bbdf4e731274856d626006362b5')

build() {

    cd ${_pkgname}

    python -m build --wheel --no-isolation

}

package() {

    cd ${_pkgname}

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
