# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: kang <kang@insecure.ws>

_name=sphinxcontrib-newsfeed
pkgname=python-sphinxcontrib-newsfeed
pkgver=0.1.4
pkgrel=14
pkgdesc="News Feed extension for Sphinx"
arch=('any')
url="https://github.com/Cyclododecene/newsfeed"
license=('BSD')
depends=('python-sphinx')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('96d9d0c15fca8b62f945bafc8f0eafa62df9c471f7510e2f153e47b66534e5f3041e5c01df772e6c35a9f09baa70064642f7f0fa43ccfd33dd64c2604494f2fc')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}
