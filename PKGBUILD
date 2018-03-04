# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix

pkgname=faience-ng-icon-theme-git
pkgver=20180217.r0.g15c909e
pkgrel=1
pkgdesc="Continued development of Faenza\Faience Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1210208/"
license=('GPL3')
makedepends=('git')
provides=('faience-ng-icon-theme')
conflicts=('faience-ng-icon-theme')
options=(!strip)
source=("${pkgname}::git+https://github.com/faience/faience-ng-icon-theme.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/${pkgname}/Faience* ${pkgdir}/usr/share/icons
}
