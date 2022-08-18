# Maintainer : MorsMortium <morsmortium@gmail.com>

pkgname=lbry-gtk
pkgver=0.7
pkgrel=1
pkgdesc='Native desktop LBRY client'
arch=('any')
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=('GPL-3.0')
depends=('python' 'python-appdirs' 'python-gobject' 'python-cairo' 'python-requests' 'python-pillow' 'python-markdown' 'gtk3' 'lbrynet' 'python-setproctitle')
provides=("${pkgname}")
makedepends=('git')
sha1sums=('487e33eac0ae0d455f2c8522d376cc8340619e6d')
source=("${pkgname}::${url}/archive/${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 ./share/icons/hicolor/scalable/apps/${_pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg
  install -Dm 755 ./bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm 755 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  cp -a ./share/${_pkgname} ${pkgdir}/usr/share/${_pkgname}
}
