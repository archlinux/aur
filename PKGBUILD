# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-wrangle"
_pkgname="wrangle"
pkgver=0.6.7
pkgrel=1
pkgdesc="Wrangle takes the headache away from most common data preparation and wrangling tasks."
arch=('any')
url="https://github.com/autonomio/wrangle/"
license=('MIT')
depends=('python' 'python-keras' 'python-statsmodels' 'python-scikit-learn' 'python-numpy' 'python-pandas' 'python-scipy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/85/35/bc729e377417613f2d062a890faea5d649ef1a554df21499e9c3a4a5501a/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('54af87cdcd8351f2f82a4e282e4487530befcf9727fd7954015ae8f466d21ef0')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
