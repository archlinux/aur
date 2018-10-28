# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-ncclient
_pkgbase="${pkgbase#python-}"
pkgname=(python-ncclient python2-ncclient)
pkgver=0.6.3
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
  'python2-paramiko'
  'python2-lxml'
  'python2-selectors2'
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/ncclient/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('033f78fae7746d11db9e052e27f4aca7a9a9c411832d957c65934b17ffb83556')

package_python-ncclient() {
  depends=('python-paramiko'
           'python-lxml'
           'python-selectors2'
           'python-six')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-ncclient() {
  depends=('python2-paramiko'
           'python2-lxml'
           'python2-selectors2'
           'python2-six')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
