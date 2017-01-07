# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-graphviz
_pkgbase="${pkgbase#python-}"
pkgname=(python-graphviz python2-graphviz)
pkgver=0.5.2
pkgrel=2
pkgdesc='Simple Python interface for Graphviz.'
arch=(any)
url='https://github.com/xflr6/graphviz'
license=(MIT)
depends=('graphviz')
makedepends=(
  'python-setuptools'
  'python2-setuptools'
)
options=(!emptydirs)
source=("https://github.com/xflr6/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('eb6eb17dbb154f428fd577aee33d4d52477f2f64a5b07cc26d2d308026efa4b8')

package_python-graphviz() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-graphviz() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
