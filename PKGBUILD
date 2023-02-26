# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-py-gfm
_pkgname=py-gfm
pkgver=2.0.0
pkgrel=1
pkgdesc="Github-Flavored Markdown for Python-Markdown"
url="https://github.com/Zopieux/py-gfm"
arch=(any)
license=('custom')
depends=('python' 'python-markdown')
makedepends=('python-setuptools')
source=("https://github.com/Zopieux/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('45d62280465bdc0cc51fc3e74486d0923c71fce7497ca29d68ba7bce232bf423d209b7ee54170d2ae283374c4e5979766d95e13ce9285bff303e7a5a83e1e12b')

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
