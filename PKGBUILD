# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-fisher
pkgver=0.1.9
pkgrel=1
pkgdesc="Fishers Exact Test"
arch=(x86_64)
url=https://github.com/brentp/fishers_exact_test
license=(BSD)
depends=(python)
makedepends=(python-setuptools cython)
source=("https://github.com/brentp/fishers_exact_test/archive/v${pkgver}.tar.gz")
sha256sums=('08602004b4810d43630e2beec97b06ca11b6e2d80cc09205a67eb3fde55ad1c2')

prepare() {
  cd "fishers_exact_test-${pkgver}"
  find . -iname "*.pyx" | xargs -n 1 cython
}

build() {
  cd "fishers_exact_test-${pkgver}"
  python setup.py build
}


package(){
  cd "fishers_exact_test-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
