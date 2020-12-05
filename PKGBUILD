# Maintainer: Mufeed Ali <fushinari@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-wn
_author=goodmami
_gitname=wn
pkgver=0.2.0
pkgrel=1
pkgdesc="Stand-alone WordNet API"
arch=('any')
url='https://github.com/goodmami/wn'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$_gitname-v$pkgver.tar.gz::https://files.pythonhosted.org/packages/f8/83/a8890dedd188648b3037cc78c2a6bef9ffd25d300e7952272ebb39047769/${_gitname}-${pkgver}.tar.gz")
sha256sums=('e14a6ea9168ed10af0e2aaf2801accaa038d1c85886aff55b5054dd694cfbcec')

build() {
    cd $_gitname-$pkgver
    python setup.py build
}

package() {
    cd $_gitname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

