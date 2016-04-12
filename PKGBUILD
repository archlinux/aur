# Maintainer: Justin Dray <justin@dray.be>
# Contributor: jsh <jsh at myreseau dot org>

pkgname=gnome-shell-extension-topicons
pkgver=28
pkgrel=4
pkgdesc="Shows legacy tray icons on top."
arch=('any')
url="https://extensions.gnome.org/extension/495/topicons/"
license=('GPL')
depends=('gnome-shell')
groups=('gnome-shell-extensions')
#source=("http://adel-dev.abaton.at/repo/topicons/snapshot/topicons-${pkgver}.tar.gz")
source=("https://repo.dray.be/package-files/topicons-28.tar.gz")
sha256sums=('569760b6f62a8b9e40ac3a1b6fa44572bd86416008fff1f0ef8b54215e2ec8a6')

build() {
	cd $srcdir
	sed -i 's/"3.18"/"3.18",\n    "3.20"/g' topicons-*/metadata.json
}

package() {
  uuid='topIcons@adel.gadllah@gmail.com'
  cd "${srcdir}/topicons-${pkgver}"

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/extension.js"
}
