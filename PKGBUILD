# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=hunspell-sl
pkgver=2019.07.28
pkgrel=1
pkgdesc="Slovene hunspell dictionary"
arch=(any)
url="https://extensions.libreoffice.org/extensions/slovenian-dictionary-pack/"
license=('LGPL2.1')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://extensions.libreoffice.org/extensions/slovenian-dictionary-pack/2019-07.28/@@download/file/pack-sl.oxt")
sha256sums=('d8e85d952a7a0e6998e13e497c6f91a0d1008d10c6e757bf9de7eeca4f0b670e')

package() {
  install -Dm644 sl_SI.aff "$pkgdir"/usr/share/hunspell/sl_SI.aff
  install -Dm644 sl_SI.dic "$pkgdir"/usr/share/hunspell/sl_SI.dic

  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.dic "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.aff "$pkgdir"/usr/share/myspell/dicts
}
