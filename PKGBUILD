# Maintainer: Daneel <aur@gnoulibre.org>

pkgname='grammalecte-fr'
pkgver='0.6.5'
pkgrel=1
pkgdesc="A grammar checker dedicated to the French language"
arch=('any')
url="https://dicollecte.org/grammalecte/index.php"
license=('GPL3')
depends=('python')
makedepends=('unzip')
backup=()
options=(!emptydirs)
source=("http://www.dicollecte.org/grammalecte/zip/Grammalecte-fr-v$pkgver.zip"
        'grammalecte.sh')
sha256sums=('60b998f7a95953781e4a10254a6bc44e7fb6d676d8f94d5c5111b6f786967e85'
            '6ef0043a2008c7f575354145de1617fabd3c4c07d73aee2fb3666431accd69ef')

package() {
  python setup.py install \
    --root="$pkgdir/" \
    --install-data="/usr/share/$pkgname" \
    --optimize=1
  sed -i "s@BINPATH@/usr/share/$pkgname@g" grammalecte.sh
  install -d $pkgdir/usr/bin
  install grammalecte.sh $pkgdir/usr/bin/grammalecte
}

# vim:set ts=2 sw=2 et:
