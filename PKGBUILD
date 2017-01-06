# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: kang <kang@insecure.ws>

_pkgbase=sphinxcontrib-newsfeed
pkgbase=python-${_pkgbase}
pkgname=("python-${_pkgbase}" "python2-${_pkgbase}")
pkgver=0.1.4
pkgrel=3
pkgdesc="News Feed extension for Sphinx"
arch=('any')
url="https://bitbucket.org/prometheus/sphinxcontrib-newsfeed"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/s/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('96d9d0c15fca8b62f945bafc8f0eafa62df9c471f7510e2f153e47b66534e5f3041e5c01df772e6c35a9f09baa70064642f7f0fa43ccfd33dd64c2604494f2fc')

prepare() {
  rm -rf -- "${srcdir}/${_pkgbase}-${pkgver}-py2"
  cp -a -- "${srcdir}/${_pkgbase}-${pkgver}"{,-py2}
}

package_python-sphinxcontrib-newsfeed() {
  depends=('python-sphinx')
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-sphinxcontrib-newsfeed() {
  depends=('python2-sphinx')
  cd "${srcdir}/${_pkgbase}-${pkgver}-py2"

  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
