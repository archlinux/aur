# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-astetik"
_pkgname="astetik"
pkgver=1.9.8
pkgrel=1
pkgdesc="Astetik provides a very high level overlay on Seaborn and matplotlib. It is a data visualization library for data exploration, and for telling captivating stories with data."
arch=('any')
url="https://github.com/autonomio/astetik"
license=('MIT')
depends=('python' 'python-statsmodels' 'python-scikit-learn' 'python-numpy' 'python-pandas' 'python-wrangle' 'python-seaborn' 'python-patsy' 'python-geonamescache' 'ipython')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/03/c7/d074a03a59f55708cacb875c008bf375028c452a1ffcc452762a3c3dfed2/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bcc4baba5d3a909e3ee91d109993b752cae7829c2c174f8f2c6d07d33ae4c47b')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
