# Maintainer : MorsMortium <morsmortium@gmail.com>

pkgname=lbry-gtk
pkgver=0.7.1
pkgrel=1
pkgdesc='Native desktop LBRY client'
arch=('any')
url="https://codeberg.org/MorsMortium/${pkgname}"
license=('GPL-3.0')
depends=('python' 'python-appdirs' 'python-gobject' 'python-cairo' 'python-requests' 'python-pillow' 'python-markdown' 'gtk3' 'lbrynet' 'python-setproctitle')
provides=("${pkgname}")
makedepends=('git')
sha1sums=('dc4477c212d16955e887ae8e3b1969f9cb8d790c')
source=("${pkgname}::${url}/archive/${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 ./share/icons/hicolor/scalable/apps/${pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
  install -Dm 755 ./bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm 755 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  cp -a ./share/${pkgname} ${pkgdir}/usr/share/${pkgname}
}
