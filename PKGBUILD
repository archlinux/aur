# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

pkgname=python-ptflops
_reponame="flops-counter.pytorch"
_modulename="ptflops"
pkgver=0.7.2.2
pkgrel=1
pkgdesc="Flops counter for convolutional networks in pytorch framework"
url="https://github.com/sovrasov/${_reponame}"
license=('MIT')
arch=('any')
depends=('python-pytorch')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('aa8f5ed4f20601dfef07194df22482622a9728393e98d9305a8db860a0b131ae')

build() {
  cd ${srcdir}/${_reponame}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_reponame}-${pkgver}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

