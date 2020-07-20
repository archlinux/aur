# Maintainer: piernov <piernov@piernov.org>

pkgname=python-scikit-optimize-git
pkgver=r1500.907ec9d
pkgrel=1
pkgdesc="Sequential model-based optimization toolbox."
arch=('any')
url="http://scikit-optimize.org/"
license=('BSD')
depends=('python-scikit-learn' 'python-matplotlib' 'python-pyaml')
makedepends=('python-setuptools')
conflicts=('python-scikit-optimize')
replaces=('python-scikit-optimize')
source=("git+https://github.com/scikit-optimize/scikit-optimize.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/scikit-optimize
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/scikit-optimize
  python setup.py build
}

package() {
  cd "$srcdir"/scikit-optimize
  python setup.py install --root="$pkgdir"/ --optimize=1
}

