# Maintainer: Mufeed Ali <fushinari@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-wn
_author=goodmami
_gitname=wn
pkgver=0.4.1
pkgrel=1
pkgdesc="Stand-alone WordNet API"
arch=('any')
url='https://github.com/goodmami/wn'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$_gitname-v$pkgver.tar.gz::https://files.pythonhosted.org/packages/a7/6c/49387996dba7ca768f27b1f68ee957f3ae420e99ba82bd186413b7568377/${_gitname}-${pkgver}.tar.gz")
sha256sums=('8294846fd05a65f7e29a3fba065020d57ba7c44d654aaaf3a313c3c7f7bd7615')

build() {
    cd $_gitname-$pkgver
    python setup.py build
}

package() {
    cd $_gitname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

