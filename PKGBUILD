# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python2-south-0.7
pkgver=0.7.6
pkgrel=1
pkgdesc="Intelligent database migrations library for the Django web framework"
arch=('any')
url="http://south.aeracode.org/"
license=('APACHE')
depends=('django-1.4')
makedepends=('python2-distribute')
provides=('python2-south')
conflicts=('python2-south')
source=(http://pypi.python.org/packages/source/S/South/South-$pkgver.tar.gz)
sha256sums=('d2c3c1ddf93ec7e29935088eef47984bb780e47aeb8acd5f18fbb3a72e97936a')

build() {
  cd "${srcdir}"/South-$pkgver

  python2 setup.py build
}

package() {
  cd "${srcdir}"/South-$pkgver

  python2 setup.py install --root="${pkgdir}" -O1
}
