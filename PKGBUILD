# Maintainer: Spyros Stathopoulos <spysath@gmail.com>
# Contributor: surefire <surefire@cryptomile.net>

pkgname=cinnamon-applet-mailnag-git
pkgver=r66.fcc9430
pkgrel=1
pkgdesc="This is a Cinnamon applet for showing new mail notifications"
arch=('any')
url="https://bitbucket.org/hyOzd/mailnagapplet/"
license=('GPL')
depends=('cinnamon' 'mailnag')
makedepends=('git')
provides=('cinnamon-applet-mailnag')
conflicts=('cinnamon-applet-mailnag')
source=("${pkgname}::git+https://bitbucket.org/hyOzd/mailnagapplet.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  appletdir="${pkgdir}/usr/share/cinnamon/applets/mailnagapplet@ozderya.net"
  install -dm0755 "${appletdir}"
  install -m0644 mailnagapplet@ozderya.net/* "${appletdir}"
}
