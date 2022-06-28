# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Mufeed Ali <fushinari@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-wn
_author=goodmami
_gitname=wn
pkgver=0.9.1
pkgrel=1
pkgdesc="Stand-alone WordNet API"
arch=('any')
url='https://github.com/goodmami/wn'
license=('MIT')
depends=('python-importlib_resources' 'python-requests' 'python-toml')
makedepends=('python-setuptools')
source=("$_gitname-v$pkgver.tar.gz::https://files.pythonhosted.org/packages/50/5e/9ffb97e96d1f1ca421a2c5b218ddc2e5ec145a2441d350e98ad58fa6dad0/${_gitname}-${pkgver}.tar.gz"
  setup.py)
b2sums=('525cd5513f4f46250e78b3295ba2cc57f9d96c7d953128bec061844e979108cab73e9dec4e22c90568f6d0be23c48cf888af8b3c9fbc6e050978a398c376b1f9'
        '23629d56e738eab2fd44099db1a07fa86ea69694169981d60e73feb6de4a4ec735617f4610da91e1980e8e69d075e1448e5611fa382908b62d7f778ead1ae1d8')

prepare() {
    mv setup.py $_gitname-$pkgver/setup.py
}
  
build() {
    cd $_gitname-$pkgver
    python setup.py build
}

package() {
    cd $_gitname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

