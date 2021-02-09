# Maintainer: Saren <saren@wtako.net>

pkgname=gnome-shell-extension-lunar-calendar
pkgver=v25
pkgrel=4
pkgdesc="Display Chinese Lunar Calendar in panel"
arch=('any')
url="https://extensions.gnome.org/extension/675/lunar-calendar/"
license=('GPL3')
depends=('gnome-shell>3.36' 'unzip' 'lunar-date')
# makedepends=('git' 'gnome-common')
source=("https://extensions.gnome.org/extension-data/lunarcalailin.nemui.v25.shell-extension.zip")
md5sums=('ecf6244c174c8a795babd4de423462e4')

package() {
  _uuid='lunarcal@ailin.nemui'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  rm lunarcalailin.nemui.v25.shell-extension.zip
  install -dm655 $_install_dir
  cp -r * $_install_dir
  install -Dm644 "schemas/org.gnome.shell.extensions.lunar-calendar.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}
