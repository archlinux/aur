# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=firefox-extension-omnibar
_file=278824
pkgver=0.7.28.20141004
pkgrel=1
pkgdesc="Integrates the location bar and the search bar into one."
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/8823"
license=('MPL')
depends=('firefox')
source=(https://addons.mozilla.org/firefox/downloads/file/$_file/omnibar-$pkgver.xpi)
sha1sums=('7fb603a37762c6af3c38c321f0c96baaca9fe69c')

package() {
  cd "$srcdir"
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$emid"
  find . -type f -exec install -Dm644 '{}' "$dstdir/{}" \;
}

# vim:set ts=2 sw=2 et:
