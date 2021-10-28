# Maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: mars <gzhqyz at gmail dot com>
# Contributor: Ryan Owens <RyanOwens at linux dot com>

pkgname=gnome-shell-extension-hibernate-status
pkgver=1.10
pkgrel=1
pkgdesc="Gnome Shell extension that adds a hibernate/hybrid suspend button in Status menu."
arch=('any')
url="https://github.com/arelange/gnome-shell-extension-hibernate-status"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-extension-hibernate-status')
install=gnome-shell-extension-hibernate-status.install
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('126918dd31f2b282087a3abfaed7dd0a9ba84d2fee75669864fc752e23237d7c')

package() {
  cd "$pkgname-$pkgver"
  _uuid='hibernate-status@dromi'

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
  install -m644 "confirmDialog.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/confirmDialog.js"
  install -m644 "prefs.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/prefs.js"
  glib-compile-schemas "schemas"
  install -Dm644 "schemas/gschemas.compiled" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas/gschemas.compiled"
}
