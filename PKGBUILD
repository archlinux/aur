# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-ncclient
_pkgbase="${pkgbase#python-}"
pkgname=python-ncclient
pkgver=0.6.7
pkgrel=1
pkgdesc='Python library for NETCONF clients.'
arch=(any)
url='http://ncclient.org/'
license=(Apache-2.0)
makedepends=(
  'python-paramiko'
  'python-lxml'
  'python-selectors2'
  python-setuptools
)
depends=('python-paramiko'
         'python-lxml'
         'python-selectors2'
         'python-six')
options=(!emptydirs)
source=("https://github.com/ncclient/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('aa15ae1d5a99ebfacffb0f5f9ad1655d7ff00fe9a285fde08891c1dbceff3f48')

package_python-ncclient() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
