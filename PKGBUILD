pkgname=mitogen
pkgver=0.3.51
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

sha1sums=('a86b20ccb83e9c363f7bb033ff543ee00e6d864a')
sha256sums=('6342fa59cb03b29c8470369b4857fd638d81868da65597ce03537dabce1f9e62')
sha384sums=('01c8cba95797f4097edf1abb92c5d30004976c9b550c3501f88fdea3f8b540da5d09425922a4efaa4d813a72b4ba09f2')
sha512sums=('d5b15bf2f211142be9f1c9e0fd3eb32dc3e53f80b6103491ed5614d085462e56e42aa24141ac938296e87be8f84ed52b9ddbba885337757154c0ba562e69f4e1')
