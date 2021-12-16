# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
pkgname=hyphen-ru
pkgver=20210727
_commit=30dd499
pkgrel=2
pkgdesc="Russian hyphenation rules"
arch=('any')
url='https://github.com/LibreOffice/dictionaries/tree/master/ru_RU'
license=('custom')
depends=('hyphen')
source=("${pkgname}-${_commit}.dic::https://github.com/LibreOffice/dictionaries/raw/${_commit}/ru_RU/hyph_ru_RU.dic"
        "${pkgname}-${_commit}-README.txt::https://github.com/LibreOffice/dictionaries/raw/${_commit}/ru_RU/README_ru_RU.txt")
sha256sums=('e9a6ae92765fc7e63d879f2ccf3f50f2b95bc8ed7618a6f31c34ce7d39844c83'
            '262af2f6ad70a61e5ee1332ff44fa8ee50edca819cf33207d8ad6ba6a0c9be52')

package() {
  cd "$srcdir"
  install -Dm644 "${pkgname}-${_commit}-README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/README.txt"
  install -dm755 "${pkgdir}/usr/share/hyphen"
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  install -Dm644 "${pkgname}-${_commit}.dic" "${pkgdir}/usr/share/hyphen/hyph_ru_RU.dic"
  ln -sT "/usr/share/hyphen/hyph_ru_RU.dic" "${pkgdir}/usr/share/myspell/dicts/hyph_ru_RU.dic"
}
