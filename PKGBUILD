# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=prosopopee
pkgver=1.1.5
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
         'python-pillow'
         'python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/d8/6f/ed9bcab7ce13396bb3ae8df8c4ae270539ee5ab9155feae2582c96aa2bcb/prosopopee-1.1.5.tar.gz")
sha256sums=('f895bda53af9f9625c979942a513a726c9facaba2c65c8b379850d6b877eeb56')

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
