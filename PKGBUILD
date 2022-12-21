_pkgname=vkbeautify
pkgname=python-${_pkgname}
pkgver=0.3.0
pkgrel=1
pkgdesc="python plugin to pretty-print or minify text in XML, JSON and CSS formats"
arch=('any')
url="https://github.com/willthames/ansible-lint"
license=('MIT')
depends=('python3')
#makedepends=('python-distutils')
source=(${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('bab6bceaffaadb43e14170b27969945f')


build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install --optimize=1 --root="${pkgdir}"
}
