# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-py-gfm
_pkgname=py-gfm
pkgver=0.1.3
pkgrel=1
pkgdesc="Github-Flavored Markdown for Python-Markdown"
url="https://github.com/Zopieux/py-gfm"
arch=(any)
license=('custom')
depends=('python' 'python-markdown')
makedepends=('python-setuptools')
source=("https://github.com/Zopieux/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('39fa47838ad3517a14a706a79de644cd7b845dd5ef55efda00c4c9f9f95a135f994c1c34804a6cf0fab4f619b7e9b943445219d82d7c705c6540d477ac6a3cc0')

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
