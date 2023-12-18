# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>

pkgname=laditools
pkgver=1.1
pkgrel=1
pkgdesc="Utilities to improve integration and workflow with JACK and LASH."
arch=('any')
url="https://gitea.ladish.org/LADI/laditools"
license=('GPL3')
depends=('gtk3' 'ladish' 'python' 'python-gobject' 'python-pyxdg' 'python-yaml')
makedepends=('git' 'glade' 'python-distutils-extra')
source=("git+https://gitea.ladish.org/LADI/laditools.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
