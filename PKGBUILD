# Maintainer : Beatussum <echo 'YmVhdHVzc3VtQHByb3Rvbm1haWwuY29tCg==' | base64 -d>


_pkgname=defragall
pkgname=${_pkgname}-git
pkgver=1.0.r2.gc91f1e5
pkgrel=1
pkgdesc="A simple utility to defragment all mounted subvolumes of a btrfs system"
arch=('any')
url="https://github.com/beatussum/${_pkgname}"
license=('GPL3')
depends=('btrfs-progs')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/beatussum/${_pkgname}.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="$pkgdir" install
}
