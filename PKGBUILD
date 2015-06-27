# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=python-apache-libcloud
_pkgname=apache-libcloud
pkgver=0.17.0
pkgrel=2
pkgdesc='A standard Python library that abstracts away differences among multiple cloud provider APIs.'
arch=('any')
url='https://pypi.python.org/pypi/apache-libcloud'
license=('Apache License 2')
makedepends=('python-setuptools')
depends=('python')

source=("https://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
'https://issues.apache.org/jira/secure/attachment/12686289/libcloud.patch')
md5sums=('a63650261971dc82c5a6d763a2153881'
         'b210ce9e8be48b7691c9296c4e710a67')

prepare() {
 cd ${srcdir}/${_pkgname}-${pkgver}
 patch -Np0 -i ../libcloud.patch
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
