# Maintainer: Sergey Shatunov <me@prok.pw>
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

_pkgname=pyotp
pkgname=python2-${_pkgname}
pkgver=2.2.1
pkgrel=1
pkgdesc='PyOTP is a Python library for generating and verifying one-time passwords'
arch=(any)
url='https://pyotp.readthedocs.io/'
license=('MIT')
depends=('python2' 'python-future')
makedepends=('python2-setuptools' 'unzip')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz" )
md5sums=('7c9d3c0a19d2ced48b10f0c1fd8f0bb2')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
