# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=capbattleship-git
pkgver=v1.0alpha5.r0.ga765bfa
pkgrel=1
pkgdesc="A pirate-themed battleship game"
arch=('any')
url="https://forge.tedomum.net/captnfab/capbattleship"
license=('MIT')
makedepends=('git')
depends=('python-pygame')
conflicts=('capbattleship')
provides=('capbattleship')
source=("git+https://forge.tedomum.net/captnfab/capbattleship.git")
sha384sums=('SKIP')

pkgver() {
  cd capbattleship
  git describe --tags --long | sed 's/^nbxmpp-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd capbattleship
  python setup.py build
}

package() {
  cd capbattleship
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
