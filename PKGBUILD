# Maintainer: Christopher Woodruff <cswoodruff at gmail dot com>

pkgname=python-doorstop
_pkgname=Doorstop
pkgver=0.8.4
pkgrel=1
pkgdesc="Doorstop manages the storage of textual requirements alongside source code in version control."
arch=('any')
depends=('python>=3.3' 
         'python-yaml>=3.10' 'python-yaml<4'
         'python-markdown>=2' 'python-markdown<3'
         'python-openpyxl>2.1.0' 'python-openpyxl<2.2'
         'python-bottle>=0.12' 'python-bottle<0.13'
         'python-requests>=2' 'python-requests<3'
         'python-pyficache>=0.2.3' 'python-pyficache<0.3'
         'python-pygments')
makedepends=('python-setuptools')
url="https://pypi.python.org/pypi/doorstop"
license=('LGPL3')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/D/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('f6a17593f1ee7af7e775bda41e05f752')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}" -O1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh ts=2 sw=2 et
