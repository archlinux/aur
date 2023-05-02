# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=hunspell-sl
pkgver=2023.01.03
pkgrel=1
pkgdesc="Slovene hunspell dictionary"
arch=(any)
url="https://extensions.libreoffice.org/en/extensions/show/slovenian-dictionary-pack"
license=('LGPL2.1')
optdepends=('hunspell: the spell checking libraries and apps')
source=('https://extensions.libreoffice.org/assets/downloads/752/1672786274/pack-sl.oxt')
sha512sums=('818431e00b6fee941f5eb43de3cbaf1a456d4ed6a3d1c4717b5827830ae1edc53dd634e85e777b77faa15b303277aeea5f3fb518f92392b40b93f16a425b6d94')

package() {
  install -Dm644 sl_SI.aff "$pkgdir"/usr/share/hunspell/sl_SI.aff
  install -Dm644 sl_SI.dic "$pkgdir"/usr/share/hunspell/sl_SI.dic

  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.dic "$pkgdir"/usr/share/myspell/dicts
  ln -sf /usr/share/hunspell/sl_SI.aff "$pkgdir"/usr/share/myspell/dicts
}
