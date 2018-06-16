# Maintainer: 

pkgname=sparky-dashboard-git
pkgver=r4.46912d8
pkgrel=1
pkgdesc="The Sparky dashboard displays applications from /usr/share/applications dir into yad based window"
arch=('any')
url="https://github.com/sparkylinux/sparky-dashboard"
license=(GPL3)
depends=('yad')
makedepends=('git')
provides=('sparky-dashboard')
conflicts=('sparky-dashboard')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm775 ${srcdir}/${pkgname}/bin/sparky-dashboard ${pkgdir}/usr/bin/sparky-dashboard
  install -Dm775 ${srcdir}/${pkgname}/share/sparky-dashboard.desktop  ${pkgdir}/usr/share/applications/sparky-dashboard.desktop
}
