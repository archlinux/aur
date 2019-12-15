# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgbase=python-pprintpp
pkgname=(python-pprintpp python2-pprintpp)
pkgver=0.4.0
pkgrel=1
pkgdesc="Extension of Python package pycountry providing conversion functions."
arch=('any')
url="http://pypi.python.org/pypi/pprintpp"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.io/packages/source/p/${pkgbase#python-}/${pkgbase#python-}-${pkgver}.tar.gz")
sha512sums=('c59d759744499ec74bbbbcf440a45b4bb5a1ed0586cd76d444da764eb3e3c02ef5e883c00c0501f1138baa84b04f5e89ce3f8c9ed7a9cbe65c93d42deb573010')

package_python2-pprintpp() {
  depends=('python2')
  cd "${srcdir}/${pkgbase#python-}-${pkgver}"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-pprintpp() {
  depends=('python')
  cd "${srcdir}/${pkgbase#python-}-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1
}
