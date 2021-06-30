
pkgname=python2-hypothesis
# Do not update. This is the last version supporting Python2
pkgver=4.57.1
pkgrel=1
pkgdesc="Advanced Quickcheck style testing library for Python (4.x is the last version supporting Python2)"
arch=('any')
license=('MPL')
url="https://hypothesis.readthedocs.org"
depends=('python2-attrs' 'python2-sortedcontainers')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HypothesisWorks/hypothesis/archive/hypothesis-python-$pkgver.tar.gz")
sha512sums=('28622ce8a1d89d09df65f3fbf7e92a1ad98dac140ab646fe11fcb15e6aa9a9672eb51d459f984384d92b819f902de911b06cec2542582d529dd556d2f99ed952')

prepare() {
  mv hypothesis-hypothesis-python-$pkgver hypothesis-$pkgver
}

build() {
  cd hypothesis-$pkgver/hypothesis-python
  python2 setup.py build
}

package() {
  cd hypothesis-$pkgver/hypothesis-python
  python2 setup.py install --root="$pkgdir" --optimize=1
}
