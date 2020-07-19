# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=prosopopee
pkgver=1.0.1
pkgrel=1
pkgdesc='A static website generator to make beautiful customizable pictures galleries that tell a story'
arch=('any')
url='https://github.com/Psycojoker/prosopopee'
license=('GPL3')
conflicts=('prosopopee-git')
depends=('python-jinja'
         'python-path'
         'python-docopt'
         'python-ruamel-yaml'
         'python-future'
         'python-pillow')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Psycojoker/prosopopee/archive/${pkgver}.tar.gz")
sha256sums=('f0e46b200cddb37ac3890f8ae8293e2f59583ada2fe646d9e42138a49fab558c')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: