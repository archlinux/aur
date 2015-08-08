# $Id$
# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris [at] fordham-nagy [dot] id [dot] au>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/python-bcdoc/PKGBUILD

set -u
pkgname='python-bcdoc'
_pkgname='bcdoc'
pkgver='0.12.2'
pkgrel='1'
pkgdesc='Tools to help document botocore-based projects.'
arch=('any')
url='https://github.com/boto/bcdoc'
license=('Apache 2.0')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/boto/bcdoc/archive/${pkgver}.tar.gz")
sha256sums=('f1dc05496a5caa32a1e2ce8c7e02c39862ae2786552be5c2e10f9e5aa49e7d37')

package() {
  set -u
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  # do not include the tests/ generated from the install
  #msg 'Removing tests.'
  #rm -Rfv "${pkgdir}/usr/lib/python*/site-packages/tests"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
