# Maintainer: Olivier Biesmans <o.aur@biesmans.fr>
# Contributor: Florian Latifi <mail@florian-latifi.at>
pkgname=gnome-shell-extension-stocks-extension
pkgver=33
pkgrel=1
pkgdesc="An extension to display stock quotes in GNOME Shell Panel"
arch=("any")
url="https://github.com/cinatic/stocks-extension"
license=("GPL")
provides=("gnome-shell-extension-stocks-extension")
depends=("gnome-shell")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/stocks-extension.zip")
sha256sums=('2344b826d1080e7491b52b60a93074290d70dcfe2647c1477359168e2979995b')

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
