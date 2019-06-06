# Maintainer: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname="python-wrangle"
_pkgname="wrangle"
pkgver=0.6.4
pkgrel=1
pkgdesc="Wrangle takes the headache away from most common data preparation and wrangling tasks."
arch=('any')
url="https://github.com/autonomio/wrangle/"
license=('MIT')
depends=('python' 'python-keras' 'python-statsmodels' 'python-scikit-learn' 'python-numpy' 'python-pandas' 'python-scipy=1.2.1')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/17/9d/43d42e8bb95ef067635494fa8a0219a97d100c7ff96fb825ac01b72670b9/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('7dd1e71a3e8ed4285385c82863dcbb5f47da134500ddbd3b32cc8cb8a4e53033')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
