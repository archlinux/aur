# Maintainer: Anthony25 <Anthony Ruhier>

pkgbase=python-gazelleapi
_pkgbase="${pkgbase#python-}"
pkgname=(python-gazelleapi python2-gazelleapi)
pkgver=0.1.4
pkgrel=3
pkgdesc='An API for interacting with Gazelle based sites'
arch=(any)
url='https://github.com/itismadness/gazelleapi'
license=(MIT)
makedepends=(
  python-setuptools
  python-future
  python-requests
  python2-setuptools
  python2-future
  python2-requests
)
options=(!emptydirs)
source=("https://github.com/itismadness/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('29bb94b16dd1d8924c4650373243fac8612e3ea36eef0017b6bf838536cd5e95')

package_python-gazelleapi() {
  depends=('python-future' 'python-requests')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-gazelleapi() {
  depends=('python2-future' 'python2-requests')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
