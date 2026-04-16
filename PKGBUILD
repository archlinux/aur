pkgname=mitogen
pkgver=0.3.46
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

sha1sums=('4ae692e72b7bcf292eb2d73535083e6da2729327')
sha256sums=('14f8d1a17d91a0c02b6231d80bbbb59a5165142e3741b3afcbb9eced56cf810a')
sha384sums=('9ab7dbadb1c960eb4dffc43c884531774dbda6e7da891b276d5b79ab143ae8bd204ce3911600c598596ffb95a70b0e0e')
sha512sums=('f5cf934d7ee86de05387ee6327bf9b7d251977e29eb812df194c971b5ab74132f2c2d5f4af7fa9009ba9b4fb3355a7113837311853d67f4ba8b1b3fb69b10b7c')
