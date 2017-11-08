# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>

pkgname='python-justbases'
pkgver=0.12
pkgrel=1
pkgdesc='Conversion of a rational number to a representation in any base.'
arch=('any')
license=('GPLv2')
url='https://github.com/mulkieran/justbases'
depends=('python-six')
makedepends=('python-tox')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '22273facc37cc54bdcd15bc6632306539783520922c7bbdef6b4c1bc50d9b15b'
)

check() {
  cd "${pkgname/python-}-${pkgver}"

  msg2 "Skipping: coverage"
  msg2 "Skipping: lint"
  tox -e test
}

package() {
  cd "${pkgname/python-}-${pkgver}"

  python setup.py install --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:
