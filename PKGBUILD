# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Vinycius Maia <suportevg@uol.com.br>

pkgname=firefox-extension-greasemonkey
_file=370452
pkgver=3.6
pkgrel=1
pkgdesc="Customize the way a web page displays or behaves, by using small bits of JavaScript."
arch=('any')
url="http://www.greasespot.net/"
license=('MPL')
depends=('firefox>=35.0')
source=(https://addons.mozilla.org/firefox/downloads/file/$_file/greasemonkey-$pkgver.xpi)
sha1sums=('35b76e5cc77087ac1fc6b0400fc4d0ae57eb57d5')

package() {
  cd "$srcdir"
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$emid"
  find . -type f -exec install -Dm644 '{}' "$dstdir/{}" \;
}

# vim:set ts=2 sw=2 et:
