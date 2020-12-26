# Maintainer: Mufeed Ali <fushinari@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com> 

pkgname=python-wn
_author=goodmami
_gitname=wn
pkgver=0.3.0
pkgrel=1
pkgdesc="Stand-alone WordNet API"
arch=('any')
url='https://github.com/goodmami/wn'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$_gitname-v$pkgver.tar.gz::https://files.pythonhosted.org/packages/98/4c/318657e4dbc334f9e72735c0e9260d2a695369d7a574fbc57d111d25199d/${_gitname}-${pkgver}.tar.gz")
sha256sums=('549fa93a76be712840ffe0f361310eb5a858fae01cab268cfd568d79b7940499')

build() {
    cd $_gitname-$pkgver
    python setup.py build
}

package() {
    cd $_gitname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

