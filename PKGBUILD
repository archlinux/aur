# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Stas Solovey <whats_up@tut.by>
pkgname=hunspell-ru
pkgver=20131101
pkgrel=4
pkgdesc="Russian hunspell dictionary"
arch=('any')
url='https://code.google.com/p/hunspell-ru/'
license=('LGPL3')
depends=('hunspell')
source=("$pkgname-$pkgver.zip::https://bitbucket.org/Shaman_Alex/russian-dictionary-hunspell/downloads/ru_RU_UTF-8_${pkgver}.zip")
sha256sums=('c9c30ca305705691fea4810137763f3b790676aa534a5cd6dfc9b45659aa9408')

package() {
  install -dm755 "${pkgdir}/usr/share/hunspell"
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  for dict in ru_RU.*; do
    install -vm644 "${dict}" "${pkgdir}/usr/share/hunspell"
    ln -sv "/usr/share/hunspell/${dict}" "${pkgdir}/usr/share/myspell/dicts"
  done
}
