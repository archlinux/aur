# Maintainer: Jose Riha <jose1711 gmail com>
# based on python-pyfiglet in aur

pkgname=python2-pyfiglet
pkgver=0.8.post1
pkgrel=1
pkgdesc="An implementation of figlet written in python (python2)"
url="https://github.com/pwaller/pyfiglet"
license=('GPL2')
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/pyfiglet/pyfiglet-${pkgver}.tar.gz)
sha512sums=('3b8c7b4c9ae48466da3ccc6711aac9c35b08a373abbdda66c60a62f17ba6edd316b0d5e3085613f7c44fbaa2f02acc4a5b3830a31d22437d9261863878421400')


build() {
  cd "$srcdir/pyfiglet-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/pyfiglet-${pkgver}/"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv ${pkgdir}/usr/bin/pyfiglet ${pkgdir}/usr/bin/pyfiglet_py2
}

# vim:set ts=2 sw=2 et:
