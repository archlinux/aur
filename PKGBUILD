# Maintainer: Anthony Ruhier <Anthony Ruhier>
#
# Thanks to nosada <ngsksdt@gmail.com> for his PKGBUILD

pkgname=python2-py-gfm
_pkgname=py-gfm
pkgver=0.1.3
pkgrel=1
pkgdesc="Github-Flavored Markdown for Python-Markdown"
url="https://github.com/google/py-gfm"
arch=(any)
license=('custom')
depends=('python2' 'python2-markdown')
source=("https://github.com/Zopieux/${_pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('49d7844a88f06b25046a1e956d28cfc422f38c99')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir}
  install -Dm644 LICENSE \
            ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
