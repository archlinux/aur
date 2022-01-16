# Maintainer: Eric Cheng <eric@chengeric.com>

pkgname=gnome-shell-extension-earth-view-wallpaper
_pkgname=earth-view-wallpaper-gnome-extension
pkgver=13
pkgrel=1
pkgdesc=" A beautiful satellite image from Google Earth as your GNOME desktop wallpaper. "
arch=('any')
url="https://github.com/neffo/earth-view-wallpaper-gnome-extension"
license=('GPL')
depends=('gnome-shell>=3.28')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dbbe08c452ea87b2330c8e27c5fb83f05a9e5812410bee71bb325ccfba097fd8')

package() {
  _uuid='GoogleEarthWallpaper@neffo.github.com'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d $_install_dir
  cd "${srcdir}"/${_pkgname}-${pkgver}
  cp -r * ${_install_dir}
  install -Dm644 "schemas/org.gnome.shell.extensions.googleearthwallpaper.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
