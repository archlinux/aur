# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>

# TODO: python38-fastcluster is optional dependency (move from AUR)

pkgname=python38-seaborn
pkgver=0.11.2
pkgrel=3
pkgdesc="Statistical data visualization"
arch=('any')
url="https://seaborn.pydata.org/"
license=('BSD')
depends=('python38-pandas' 'python38-matplotlib' 'python38-scipy')
makedepends=('python38-setuptools')
optdepends=('python38-statsmodels: for some advanced statistical plots')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mwaskom/seaborn/archive/v${pkgver}.tar.gz")
sha256sums=('693e3877d7608e08201feb6b99a7c9fce06ecaa88acbb8c3e928bdff9feb8515')

build() {
  cd "$srcdir"/seaborn-${pkgver}
  python3.8 setup.py build
}

package() {
  cd "$srcdir"/seaborn-${pkgver}

  python3.8 setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
