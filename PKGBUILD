# Maintainer: Mufeed Ali <fushinari@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-wn
_author=goodmami
_gitname=wn
pkgver=0.6.1
pkgrel=1
pkgdesc="Stand-alone WordNet API"
arch=('any')
url='https://github.com/goodmami/wn'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$_gitname-v$pkgver.tar.gz::https://files.pythonhosted.org/packages/95/f3/47ba0d59da763379fa1ee99ebb65ab132c63e3f9186b8f016c8d1b6a8278/${_gitname}-${pkgver}.tar.gz")
sha256sums=('5135ac500533787d5924e948a9c5df71382444ec25a2264d36ca7a2e0497dc55')

build() {
    cd $_gitname-$pkgver
    python setup.py build
}

package() {
    cd $_gitname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

