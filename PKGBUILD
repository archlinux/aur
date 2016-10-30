# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-ncclient
_pkgbase="${pkgbase#python-}"
pkgname=(python-ncclient python2-ncclient)
pkgver=0.5.2
pkgrel=1
pkgdesc='Python library for NETCONF clients.'
arch=(any)
url='http://ncclient.org/'
license=(Apache-2.0)
makedepends=(
  'python-paramiko'
  'python-lxml'
  python-setuptools
  'python2-lxml'
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/ncclient/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('477c15d8cf51efaffefd8cf6e1369c3f3af4ef884ecce79b49e4be782b4775ad')

package_python-ncclient() {
  depends=('python-paramiko'
           'python-lxml')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-ncclient() {
  depends=('python-paramiko'
           'python2-lxml')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
