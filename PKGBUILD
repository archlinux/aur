# Maintainer: stiglers-eponym
pkgname=beamerpresenter
pkgver=r20.c7fc597
pkgrel=1
pkgdesc="Simple dual screen pdf presentation software"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('GPL3')
depends=('poppler-qt5' 'qt5-multimedia')
makedepends=('git')
source=('git://github.com/stiglers-eponym/BeamerPresenter.git')
md5sums=('SKIP')
backup=("etc/${pkgname}/${pkgname}.conf")

pkgver() {
  cd "${srcdir}/BeamerPresenter"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/BeamerPresenter"
  qmake && make
}

package() {
  cd "${srcdir}/BeamerPresenter"
  install -Dm755 beamerpresenter "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 beamerpresenter.conf "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
}
