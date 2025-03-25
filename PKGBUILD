# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=biblia-git
pkgver=0.0.0
pkgrel=0
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Bible viewer for MyBible mobile application's modules"
arch=('any')
url="https://gitverse.ru/naierchou/biblia"
license=('GPL-3.0')
depends=('mybible-module-kjv' 'webappview-git')
optdepends=('mybible-module-pbti' 'mybible-module-ogb' 'mybible-module-rst')
makedepends=()
source=("git+https://gitverse.ru/naierchou/biblia.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git rev-parse --short HEAD
}

package() {
  PREFIX="/usr/local"
  cd "$srcdir/${pkgname%-git}"
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}${PREFIX}/share/webappview/
  cp -r application/* ${pkgdir}${PREFIX}/share/webappview/
  cp -r shortcuts/* ${pkgdir}/usr/share/applications
}
