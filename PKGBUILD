# Maintainer: Daneel <aur@gnoulibre.org>

pkgname='grammalecte-fr'
pkgver='0.5.17'
pkgrel=1
pkgdesc="A grammar checker dedicated to the French language"
arch=('any')
url="https://dicollecte.org/grammalecte/index.php"
license=('GPL3')
depends=('python')
makedepends=('unzip')
backup=()
options=(!emptydirs)
source=("http://www.dicollecte.org/grammalecte/oxt/Grammalecte-fr-v$pkgver.zip"
        'grammalecte.sh')
md5sums=('c506b6ff75c9ed5285a911396595e201'
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
