# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=stear-keyboard
pkgname=$_pkgname
pkgver=0.1
pkgrel=2
pkgdesc="Simple remote keyboard"
arch=('any')
url="https://gitlab.gnome.org/tallero/stear-keyboard"
license=(AGPL3)
depends=(python-appdirs python-keyboard python-gnupg python-setproctitle)
source=("git+https://gitlab.gnome.org/tallero/$_pkgname#tag=$pkgver")
conflicts=("stear-keyboard")
provides=("stear-keyboard")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

package() {
  cd $_pkgname
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
