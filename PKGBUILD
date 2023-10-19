# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-num2words'
pkgver=0.5.13
pkgrel=1
pkgdesc="Python modules to convert numbers to words."
arch=('any')
url='https://github.com/savoirfairelinux/num2words'
license=('LGPL')
makedepends=('python-setuptools' 'python-pip')
checkdepends=('python')
source=("https://github.com/savoirfairelinux/num2words/archive/v${pkgver}.tar.gz")
sha256sums=('79816a3a162c0563fe8149373d945966a941f6b34922960d7d3fd64275cb7c77')

prepare() {
  cd "${srcdir}/num2words-${pkgver}"
}

check() {
  cd "${srcdir}/num2words-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/num2words-${pkgver}"
  python setup.py install --root=${pkgdir} 
}
