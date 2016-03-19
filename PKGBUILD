# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-py-gfm
_pkgname=py-gfm
pkgver=0.1.2
pkgrel=1
pkgdesc="Github-Flavored Markdown for Python-Markdown"
url="https://github.com/google/py-gfm"
arch=(any)
license=('custom')
depends=('python' 'python-markdown')
source=("https://github.com/Zopieux/${_pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('b5de60eb4535683197bf8df735f066c5c722b777')

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
