# Maintainer: Kamil Krzyżanowski <kamnxt@kamnxt.com>
_pkgname=libfusion
_reponame=LibFusion
pkgname=${_pkgname}-git
pkgver=20151023.633cb0e
pkgrel=1
pkgdesc="A game management library used by the Fusion Launcher"
arch=('i386' 'x86_64')
url="https://github.com/FusionLauncher/LibFusion"
license=('GPL2')
depends=('qt5-base')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!emptydirs)
source=("${_pkgname}::git+https://github.com/FusionLauncher/LibFusion")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake-qt5 CONFIG+=release
  make
}
package() {
  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
