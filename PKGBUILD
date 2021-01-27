# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-astetik"
_pkgname="astetik"
pkgver=1.11.1
pkgrel=1
pkgdesc="Astetik provides a very high level overlay on Seaborn and matplotlib. It is a data visualization library for data exploration, and for telling captivating stories with data."
arch=('any')
url="https://github.com/autonomio/astetik"
license=('MIT')
depends=('python' 'python-statsmodels' 'python-scikit-learn' 'python-numpy' 'python-pandas' 'python-wrangle' 'python-seaborn' 'python-patsy' 'python-geonamescache' 'ipython')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/fc/17/a53638b65e16f49ae45e3886b481a2f4b2842ff3235fe6aab297f6357750/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('515c8bfe50258a60a0f3fda68dd0a6b918911a3838cf5eaa160a8c2160c1f38a')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
