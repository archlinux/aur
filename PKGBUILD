# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

_commit='4585f1c81cb46b6f6cc4fdad808ff527d4f57e75'
pkgbase=python-itunes
pkgname=('python-itunes' 'python2-itunes')
pkgver=2015.07.29
pkgrel=1
pkgdesc='A simple python wrapper to access iTunes Store API'
arch=('any')
url='https://github.com/ocelma/python-itunes'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/ocelma/python-itunes/archive/${_commit}.tar.gz"
        "python-itunes.patch")
sha256sums=('9ece82d09049109523fbefcdbe2b5399a0fff341241af735ea081078a81034c8'
            '0385dd216d5152dc944a2a54ecc9e83765e303cacf1c2169862506974a5448d6')

prepare() {
  cp -r python-itunes-${_commit} python-itunes-${pkgver}
  cp -r python-itunes-${_commit} python2-itunes-${pkgver}

  # Fix python3 issue https://github.com/ocelma/python-itunes/issues/19
  patch -p0 <python-itunes.patch
}

package_python-itunes() {
  cd python-itunes-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize='1'
}

package_python2-itunes() {
  cd python2-itunes-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize='1'
}
