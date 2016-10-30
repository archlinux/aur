# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-graphviz
_pkgbase="${pkgbase#python-}"
pkgname=(python-graphviz python2-graphviz)
pkgver=0.5.1
pkgrel=1
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
sha256sums=('00ace0aa15cda3ea61bd7882a7b3b9cedb2c026eed1f5b119a03722b906e693b')

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
