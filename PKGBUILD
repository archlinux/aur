# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-num2words
pkgname=('python-num2words' 'python2-num2words')
pkgver=0.5.7
pkgrel=1
pkgdesc="Python modules to convert numbers to words."
arch=('any')
url='https://github.com/savoirfairelinux/num2words'
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python' 'python2')
source=("https://github.com/savoirfairelinux/num2words/archive/${pkgver}.tar.gz")
sha256sums=('d64de65cfe51e4cb9848592a47d16511b2fce7b6583f38ea4c2253cf5631cc06')

check() {
  cd "${srcdir}/num2words-${pkgver}"
  python setup.py test
  python2 setup.py test
}

package_python-num2words() {
  depends=('python')
  pkgdesc="Python modules to convert numbers to words. (python3 version)"

  cd "${srcdir}/num2words-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

package_python2-num2words() {
  depends=('python2')
  pkgdesc="Python modules to convert numbers to words. (python2 version)"

  cd "${srcdir}/num2words-${pkgver}"
  python2 setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
