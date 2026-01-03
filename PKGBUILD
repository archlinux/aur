pkgname=mitogen
pkgver=0.3.36
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

sha1sums=('b71c09a13d737f3694476ba03dd82e739b54f5f2')
sha256sums=('e0bfb911eecc2b82723287edd7d330c6fecabbd2aa52b3e60b49fe56fcb58e61')
sha384sums=('2368bfda1d152307ff0aad70b094de3e6621efc310c551d78a6977cec61d6da5e9f9413e5e8cf0409af7581b5fd7e70a')
sha512sums=('6e831d692cde17a08ff63e1e2a2850672f0a881657e97bec7ad3ee8ba505828b1e072482de8f528f156c54cfacd58063e2621632e121d75b7e9d8e848efcbf4e')
