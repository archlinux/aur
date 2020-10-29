# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

pkgname=python-ptflops
_reponame="flops-counter.pytorch"
_modulename="ptflops"
pkgver=0.6.2
pkgrel=1
pkgdesc="Flops counter for convolutional networks in pytorch framework"
url="https://github.com/sovrasov/${_reponame}"
license=('MIT')
arch=('any')
depends=('python-pytorch')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5abbef678601a4cb7bead99fbbec0265a2a1746718eecf76975d888f0e2d048b')

build() {
  cd ${srcdir}/${_reponame}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_reponame}-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

