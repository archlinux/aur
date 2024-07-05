# Maintainer: Olivier Biesmans <o.aur@biesmans.fr>
# Contributor: Florian Latifi <mail@florian-latifi.at>
pkgname=gnome-shell-extension-stocks-extension
pkgver=34
pkgrel=1
pkgdesc="An extension to display stock quotes in GNOME Shell Panel"
arch=("any")
url="https://github.com/cinatic/stocks-extension"
license=("GPL")
provides=("gnome-shell-extension-stocks-extension")
depends=("gnome-shell")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/stocks-extension.zip")
sha256sums=('7e62115274c512295d025615c97d43af6f446f4b8665c1ca9eaa9cd2274f32e6')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions/stocks@infinicode.de" \
	  && cp -a "$srcdir/extension.js" "$_" \
	  && cp -a "$srcdir/prefs.js" "$_" \
	  && cp -a "$srcdir/metadata.json" "$_" \
	  && cp -a "$srcdir/stylesheet.css" "$_" \
	  && cp -a "$srcdir/components" "$_" \
	  && cp -a "$srcdir/helpers" "$_" \
	  && cp -a "$srcdir/locale" "$_" \
	  && cp -a "$srcdir/media" "$_" \
	  && cp -a "$srcdir/services" "$_"
  install -d "$pkgdir/usr/share/glib-2.0/schemas" \
          && cp "$srcdir/schemas/org.gnome.shell.extensions.stock.gschema.xml" "$_"
}
