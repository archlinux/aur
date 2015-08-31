# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Stas Solovey <whats_up@tut.by>
pkgname=hunspell-ru
pkgver=20131101
pkgrel=1
pkgdesc="Russian hunspell dictionary"
arch=('any')
url='https://code.google.com/p/hunspell-ru/'
license=('LGPL3')
depends=('hunspell')
source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/Shaman_Alex/russian-dictionary-hunspell/downloads/ru_RU_UTF-8_${pkgver}.zip")
sha256sums=('c9c30ca305705691fea4810137763f3b790676aa534a5cd6dfc9b45659aa9408')

package() {
  install -Dm644 ru_RU.dic "$pkgdir/usr/share/hunspell/ru_RU.dic"
  install -Dm644 ru_RU.aff "$pkgdir/usr/share/hunspell/ru_RU.aff"

  install -dm755 "$pkgdir/usr/share/myspell/dicts"
  ln -s /usr/share/hunspell/ru_RU.dic "$pkgdir/usr/share/myspell/dicts/ru_RU.dic"
  ln -s /usr/share/hunspell/ru_RU.aff "$pkgdir/usr/share/myspell/dicts/ru_RU.aff"
}
