# $Id$
# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris [at] fordham-nagy [dot] id [dot] au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/python-jmespath/PKGBUILD

set -u
pkgname='python-jmespath'
_pkgname='jmespath.py'
pkgver='0.7.1'
pkgrel='1'
pkgdesc='JMESPath allows you to declaratively specify how to extract elements from a JSON document.'
arch=('any')
url='https://github.com/boto/jmespath'
license=('custom')
depends=(
  'python'
)
makedepends=('python-setuptools')
source=("https://github.com/boto/jmespath/archive/${pkgver}.tar.gz")
sha256sums=('7d158a87b3629e216f6169409380801d7b1f7d2313485dcc20069882314ce9f9')

package() {
  set -u
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}"

  # do not include the tests/ generated from the install
  # There aren't any test and this line wouldn't work if there were
  # rm -Rfv "${pkgdir}/usr/lib/python*/site-packages/tests"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
