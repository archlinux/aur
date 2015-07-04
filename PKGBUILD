# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-py-gfm
_pkgname=py-gfm
pkgver=0.1.1
pkgrel=1
pkgdesc="Github-Flavored Markdown for Python-Markdown"
url="https://github.com/google/py-gfm"
arch=(any)
license=('MIT')
depends=('python' 'python-markdown')
source=("https://github.com/google/${_pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('dceb1ce680a9375b5335a113d0c6b66a09c513b5')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py install --root=${pkgdir}
  install -Dm644 LICENSE \
            ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
