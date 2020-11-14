# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=prosopopee
pkgver=1.1.4
pkgrel=1
pkgdesc='A static website generator to make beautiful customizable pictures galleries that tell a story'
arch=('any')
url='https://github.com/Psycojoker/prosopopee'
license=('GPL3')
conflicts=('prosopopee-git')
depends=('python-jinja'
         'python-path'
         'python-babel'
         'python-ruamel-yaml'
         'python-future'
         'python-pillow')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/e2/29/6f79de8bf7a26572744658d66c0e047a46b53feaab52af66e0a1badd8496/prosopopee-1.1.4.tar.gz")
sha256sums=('94fe17a6dcd173dfadf7ffb1ff4797348ee081f7b5e8f9b253fa0add7ab4a60b')

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
