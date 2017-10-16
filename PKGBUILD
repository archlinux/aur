# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-matchmaker
pkgver=0.6.0
pkgrel=1
pkgdesc="A command line tool to auto-connect JACK ports matching given patterns."
arch=('any')
url="https://github.com/SpotlightKid/jack-matchmaker"
license=('GPL2')
depends=('python-setuptools' 'jack')
source=("https://files.pythonhosted.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('26afda4e5ccc7f7c5d996eabbc75bdc7458d1871ff3d9d8b9183c5e6eeda185a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --skip-build --root="${pkgdir}" --prefix=/usr \
    --optimize=1
}
