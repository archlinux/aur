# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

pkgname=python-ptflops
_reponame="flops-counter.pytorch"
_modulename="ptflops"
pkgver=0.6.9
pkgrel=1
pkgdesc="Flops counter for convolutional networks in pytorch framework"
url="https://github.com/sovrasov/${_reponame}"
license=('MIT')
arch=('any')
depends=('python-pytorch')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dbd6a23728b0f219ceab84c4116b907310d586c2b3d4d8e5f8ad5e5934893cb8')

build() {
  cd ${srcdir}/${_reponame}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_reponame}-${pkgver}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

