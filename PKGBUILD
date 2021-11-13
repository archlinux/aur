# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=quick-lookup
pkgver=2.0.0
pkgrel=1
pkgdesc="Simple GTK dictionary application powered by Wiktionary"
arch=('any')
url="https://github.com/johnfactotum/quick-lookup"
license=('GPL3')
depends=('gjs' 'webkit2gtk-5.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0732444db4abed0c7a24caf4bd385876a57a4d98682775483c0f835521aed046')

package() {
  _name='com.github.johnfactotum.QuickLookup'

  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname.js" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$_name.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_name.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 "$_name-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
  install -Dm644 "$_name.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas"
}
