# Maintainer: Eric Cheng <eric@chengeric.com>

pkgname=gnome-shell-extension-earth-view-wallpaper
_pkgname=earth-view-wallpaper-gnome-extension
pkgver=12
pkgrel=1
pkgdesc=" A beautiful satellite image from Google Earth as your GNOME desktop wallpaper. "
arch=('any')
url="https://github.com/neffo/earth-view-wallpaper-gnome-extension"
license=('GPL')
depends=('gnome-shell>=3.28')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dbd788f21bebf958ebaab7352bfd3804dc28a946d3c8208ace2f573008f0b1df')

package() {
  _uuid='GoogleEarthWallpaper@neffo.github.com'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d $_install_dir
  cd "${srcdir}"/${_pkgname}-${pkgver}
  cp -r * ${_install_dir}
  install -Dm644 "schemas/org.gnome.shell.extensions.googleearthwallpaper.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}