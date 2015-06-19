# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-venusian
_pkgname=venusian
pkgver=1.0
pkgrel=1
pkgdesc="A library for deferring decorator actions."
arch=('any')
url="https://github.com/Pylons/venusian"
license=('custom:BSD')
depends=('python')
makedepends=('python-distribute')
source=(https://pypi.python.org/packages/source/v/venusian/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('1720cff2ca9c369c840c1d685a7c7a21da1afa687bfe62edd93cae4bf429ca5a')

build(){
cd ${srcdir}/${_pkgname}-${pkgver}
python2 setup.py build
}

package() {
cd ${srcdir}/${_pkgname}-${pkgver}
python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

