# Original: Lars Hagström <lars@foldspace.nu>
# Maintainer: Lestofante <lestofante88@gmail.com>
pkgname=s-tui-git
pkgver=v0.8.3.r0.ga7cc0a3
pkgrel=1
pkgdesc="Terminal UI stress test and monitoring tool "
arch=('any')
url="https://github.com/amanusk/s-tui"
license=('GPLv2')
groups=()
depends=('stress' 'python2' 'python2-urwid' 'python2-psutil')
makedepends=('git' 'python2-setuptools')
options=(!emptydirs)
install=
source=("$pkgname"::"git+$url")
sha1sums=('SKIP')
conflicts=("s-tui")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
