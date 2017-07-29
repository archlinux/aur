# Maintainer: Daneel <aur@gnoulibre.org>

pkgname='grammalecte-fr'
pkgver='0.5.18'
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
md5sums=('bb707f858d0b1c139c3aeeaa32f6a537'
         'affa04d4aa27559b07afa2c6607ede75')

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
