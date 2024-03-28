# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
_pkgname=cmcrameri
pkgname=python-${_pkgname}
pkgver=1.8
pkgrel=1
pkgdesc="A wrapper around Fabio Crameri's perceptually uniform colourmaps for geosciences."
arch=('any')
url="https://github.com/callumrollo/${_pkgname}/"
license=('MIT')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer')
depends=('python-numpy' 'python-matplotlib')
source=("git+${url}#tag=v${pkgver}")
sha512sums=('3ff887d650d8690de0e4cf850579a7772b078935144d26d02687dc407aae253356326b9c0e38e1b0f60d36856b71fa2817f4ecf5410961fb5e36e86f51f8d112')

build() {

    cd ${_pkgname}

    python -m build --wheel --no-isolation

}

package() {

    cd ${_pkgname}

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
