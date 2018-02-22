# Maintainer: j1simon <stemp@ono.com>

_pkgname=flameshot
pkgname=flameshot-git
pkgver=r365.423bf59
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software"
arch=('i686' 'x86_64')
url="https://github.com/lupoDharkael/flameshot"
license=('GPL')
depends=('qt5-base')
makedepends=('make qt5-tools')
provides=('flameshot-git')
conflicts=('flameshot')
source=("git+https://github.com/lupoDharkael/flameshot.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake CONFIG+=packaging BASEDIR="${pkgdir}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install
}
