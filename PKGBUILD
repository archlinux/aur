pkgname=mitogen
pkgver=0.3.45
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

sha1sums=('74cf27414f5ec534b5c7b93d1d46ab66c52dfc51')
sha256sums=('55a46e6ea447544c1bc2b2d58a9c8a6929cab67d456bf58943acadbcae64d65b')
sha384sums=('55499d985f91158929e5bbe6394412601a95c2164c8339bb17fdcf70cf92fece19071a6456baf6d46caf55d30568f265')
sha512sums=('370c6f901af62b28680022f0f95a7d72d86730d7a3eab38abbe35ef684c89497ba96c6f9b7f1ed8d42d525aacb4a4ac44a3898f6fd7dd50d19d57cb0e02ebce4')
