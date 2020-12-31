# Maintainer: Mufeed Ali <fushinari@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-wn
_author=goodmami
_gitname=wn
pkgver=0.4.0
pkgrel=1
pkgdesc="Stand-alone WordNet API"
arch=('any')
url='https://github.com/goodmami/wn'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$_gitname-v$pkgver.tar.gz::https://files.pythonhosted.org/packages/53/b2/27b250534a13c20673db4bf53f7a477bf2ebe524a59ccc124b0670abc193/${_gitname}-${pkgver}.tar.gz")
sha256sums=('206eeb0b534e6325f97e0f7a2b5c993c0e8b452eb9119ae87a96508e76f4be23')

build() {
    cd $_gitname-$pkgver
    python setup.py build
}

package() {
    cd $_gitname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

