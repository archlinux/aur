# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-py-gfm
_pkgname=py-gfm
pkgver=1.0.0
pkgrel=1
pkgdesc="Github-Flavored Markdown for Python-Markdown"
url="https://github.com/Zopieux/py-gfm"
arch=(any)
license=('custom')
depends=('python' 'python-markdown')
makedepends=('python-setuptools')
source=("https://github.com/Zopieux/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('eb1b190d4b8ebdf229141965cad57531bdb7b2c834acf9ef62a06955f5c61fdc16e85a0871121f99d2bdb0d07482ed9bc84c52e85e6a446f49e869780c463b89')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
