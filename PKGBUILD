pkgname=mitogen
pkgver=0.3.25
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD-3-Clause")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mitogen-hq/mitogen/archive/v${pkgver//_/-}.tar.gz")
arch=('any')

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha1sums=('64182a5524cea290da0d0029be554ee4b72e66d4')
sha256sums=('7775e7ca229b0f553001a4329f3e594b77e6e473d2106d809cfd80a1dc056a8b')
sha384sums=('fed4a43a2c1d92ce7c2d42ec6c4027ce133b5c26b726a3d8959e49e293a2f35fa1b643766066d98ff89ac40bacadedc4')
sha512sums=('ed060b5114d32b534e02a0992e7f8e528f252b0bed1aa51d710179c06593aae24f262c951f8b8125dba5935de56c1ebf6c10633d95afabbb3764bca2e7996907')
