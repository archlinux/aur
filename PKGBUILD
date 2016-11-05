# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-matchmaker
pkgver=0.4.0
pkgrel=1
pkgdesc="A command line tool to auto-connect JACK ports matching given patterns."
arch=('any')
url="https://github.com/SpotlightKid/jack-matchmaker"
license=('GPL2')
depends=('python-setuptools')
source=("https://pypi.python.org/packages/e2/64/7d41197ea7861db55da9ca8716e38a22ed524dbcf9b7c711e3299236a7fc/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fc4432cabbeac294c766d6f59186d864b256d549d930e641fe416ec7a750c0a9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --skip-build --root="${pkgdir}" --prefix=/usr \
    --optimize=1
}
