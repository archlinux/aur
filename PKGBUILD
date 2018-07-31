# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=eralchemy
pkgver=1.2.10
pkgrel=1
pkgdesc="Entity Relation Diagrams generation tool"
arch=('any')
url="https://github.com/Alexis-benoist/eralchemy"
license=('APACHE')
depends=('python-pygraphviz')
makedepends=('python-setuptools')
source=(https://github.com/Alexis-benoist/eralchemy/archive/v${pkgver}.tar.gz)
sha512sums=('ab3f9972f333d76c4f763c9c88572611f96cb3f8b059e3b18a358e75905236e1716f945113d191db51c6f9e6dcfcb1713b07d138df999b742cd0da58a3d3f7b3')

build() {
  cd "${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
  install -Dm755 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE.md
}
# vim:set ts=2 sw=2 et:
