# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Marcin Kulik <m@kulik.com>

name=asciinema
pkgname=asciinema-git
pkgver=2.0.0.r67.g350d5e9
pkgrel=1
pkgdesc="Record and share your terminal sessions, the right way"
arch=('any')
url="https://github.com/asciinema/$name"
license=('MIT')
makedepends=('git' 'python')
conflicts=("$name")
source=("$pkgname::git+https://github.com/asciinema/${name}.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

package() {
  cd $pkgname

  python setup.py install --root="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
