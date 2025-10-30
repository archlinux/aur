pkgname=mitogen
pkgver=0.3.30
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

sha1sums=('67010f6f8dd0ddf7a7a9a36a34d47ed278e790c8')
sha256sums=('19664630a209e0aa7f8dd0a7969760409b251f70c238f917ac62510400c9c1ee')
sha384sums=('7e5780e0f6b781067ebb811dd5aff06eb12b813b7ecf4deffb7b84597cdca0bae7d65fa453daaf59b0c0c46dcfc72d6b')
sha512sums=('ec45ebd1f65231146ee08abdc96698e04663eb29c4adad9115a7817a6aedbb447c10a16729634d34150fd0b7b9691023161341c3186f6bb71959816ddd34bd09')
