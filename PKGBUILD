# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-matchmaker
pkgver=0.5.0
pkgrel=1
pkgdesc="A command line tool to auto-connect JACK ports matching given patterns."
arch=('any')
url="https://github.com/SpotlightKid/jack-matchmaker"
license=('GPL2')
depends=('python-setuptools')
source=("https://pypi.python.org/packages/b2/6e/ff9fb518cad3949ba578ed4d34b9c22b4d0fc47c839d63af234174e3fdd5/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d41577fac2df0edfceb7fd2334a6a47e74a54749a1574c39e872de36526f72ea')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --skip-build --root="${pkgdir}" --prefix=/usr \
    --optimize=1
}
