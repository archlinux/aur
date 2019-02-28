# Maintainer: Daneel <aur@gnoulibre.org>

pkgname='grammalecte-fr'
pkgver='0.6.5'
pkgrel=2
pkgdesc="A grammar checker dedicated to the French language"
arch=('any')
url="https://dicollecte.org/grammalecte/index.php"
license=('GPL3')
depends=('python')
makedepends=('unzip')
backup=()
options=(!emptydirs)
source=("http://www.dicollecte.org/grammalecte/zip/Grammalecte-fr-v$pkgver.zip")
sha256sums=('60b998f7a95953781e4a10254a6bc44e7fb6d676d8f94d5c5111b6f786967e85')

package() {
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d $pkgdir/usr/bin
  mv \
    "$pkgdir/usr/bin/grammalecte-cli.py" \
    "$pkgdir/usr/bin/grammalecte"
  mv \
    "$pkgdir/usr/bin/grammalecte-server.py" \
    "$pkgdir/usr/bin/grammalecte-server"
}

# vim:set ts=2 sw=2 et:
