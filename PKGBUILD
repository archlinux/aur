# Maintainer: Christopher Woodruff <cswoodruff at gmail dot com>

pkgname=python-doorstop
_pkgname=Doorstop
pkgver=1.0.2
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
source=("https://pypi.python.org/packages/f9/d5/0180ec17d064ee79fbeaa29d08db0c4a68f07a65fdfc651a5ebba69549fd/${_pkgname}-${pkgver}.tar.gz"
        "https://pypi.python.org/packages/e5/92/79b796b2df034d2bea4b928b9df845f24b633cb659202b07bcc359badb22/${_pkgname}-${pkgver}-py3-none-any.whl")
md5sums=('4d7372e211cbf429dc48a94f71899468'
         '63bb160a601f5c1cc42c4e9d780a5a4e')


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}" -O1
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh ts=2 sw=2 et
