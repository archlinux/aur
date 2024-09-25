# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=normflows
_reponame=normalizing-flows
pkgname=python-${_name}
pkgver=1.7.3
pkgrel=1
pkgdesc="A PyTorch Package for Normalizing Flows"
arch=('any')
url='https://github.com/VincentStimper/normalizing-flows'
license=('MIT')
depends=('python-numpy' 'python-pytorch')
makedepends=('python-setuptools')
source=("normalizing-flows-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4a2c7405209360d25ea2a983d8a4c144aad1656ae85dcd9cfe834bd2abc6d918')

build() {
    cd ${_reponame}-${pkgver}
    python setup.py build
}

package() {
    cd ${_reponame}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
