# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>

pkgname=laditools
pkgver=1.0.1
pkgrel=2
pkgdesc="Utilities to improve integration and workflow with JACK and LASH."
arch=('any')
url="https://launchpad.net/laditools"
license=('GPL3')
depends=('jack' 'python2' 'pygtk' 'python2-yaml' 'glade' 'python2-enum')
makedepends=('git' 'python2-distutils-extra')
provides=('laditools')
conflicts=('laditools')
install=${pkgname}.install
source=("http://repo.or.cz/w/laditools.git/snapshot/2b3f5356ac5a79bcb5184498e49f3d6ea3943f14.tar.gz")
sha512sums=('3cc54e2251b244c64f9f28560cf6a03343139b1ea3e227004cd54310517ac4e4ddccae088de93fab91f934d403d084dee25c2d31b5818b4349268feafdb084b0')

build() {
  cd "${srcdir}/${pkgname}-2b3f535"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-2b3f535"
  python2 setup.py install --prefix=/usr --root="${pkgdir}/"
}
