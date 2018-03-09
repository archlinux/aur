# Maintainer: Frank Fishburn <frankthefishburn@gmail.com>
pkgname=python-nilearn
pkgver=0.4.0
pkgrel=1
pkgdesc="Python library for fast and easy statistical learning on NeuroImaging data"
arch=('any')
url="http://nilearn.github.io/"
license=('BSD')
depends=('python-scikit-learn>=0.12' 'python-nibabel>=1.10')
makedepends=('python-setuptools')
optdepends=('python-matplotlib: Plotting library for fancy examples')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nilearn/nilearn/archive/${pkgver}.tar.gz")
sha256sums=('a4b02b203d50eaf173db229ea64c856af46946a99a79134040138b126ea14627')

build() {
  cd "$srcdir"/nilearn-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/nilearn-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1
}
