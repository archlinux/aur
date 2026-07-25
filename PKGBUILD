pkgname=gnome-shell-extension-quota-glance
pkgver=1.0.2
pkgrel=1
pkgdesc='View AI service quotas and balances from a GNOME panel'
arch=('any')
url='https://github.com/Geequlim/quota-glance'
license=('GPL-3.0-or-later')
depends=('gnome-shell' 'glib2')
optdepends=('github-cli: GitHub Copilot quota provider')
source=("${pkgname}-${pkgver}.zip::https://github.com/Geequlim/quota-glance/releases/download/v${pkgver}/quota-glance@geequlim.shell-extension.zip")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('7c9a9a6c83a6358729814a56fa18abc03465187108cab0840f35de19cd13af05')

package() {
  local extension_dir="${pkgdir}/usr/share/gnome-shell/extensions/quota-glance@geequlim"

  install -dm755 "${extension_dir}"
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.zip" -C "${extension_dir}"
  glib-compile-schemas "${extension_dir}/schemas"
}
