# Maintainer: Saŭlo Rubusarbaro <saulo.rubusarbaro@mail.ru>

pkgname=wps-office-extension-spanish-mexican-dictionary
pkgver=2.6
pkgrel=1
pkgdesc='Mexican Spanish dictionary for WPS Office'
arch=('any')
url='https://github.com/sbosio/rla-es'
license=('GPL')
depends=('wps-office')
groups=('wps-office-extensions')
makedepends=('unzip')
source=(https://github.com/sbosio/rla-es/releases/download/v${pkgver}/es_MX.oxt)
sha1sums=('937ea7a1512456b978c6948907d6b35443090cf0')

package() {
  install -dm755 ${pkgdir}/usr/lib/office6/dicts/spellcheck/es_MX
  echo -e "[Dictionary] \nDisplayName=Español (México) \nDisplayName[es_US]=Español (México) \nDisplayName[es_ES]=Español (México) \nDisplayName[zh_CN]=西班牙语 (墨西哥) \nDisplayName[en_US]=Spanish (Mexico) \nDisplayName[ja_JP]=スペイン語 (メキシコ)" > ${pkgdir}/usr/lib/office6/dicts/spellcheck/es_MX/dict.conf
  unzip -q es_MX.oxt -d ${pkgdir}/usr/lib/office6/dicts/spellcheck/es_MX -x description.xml LGPLv2.1.txt package-description.txt dictionaries.xcu GPLv3.txt LGPLv3.txt Mexico.png README_hyph_es.txt th_es_v2.dat hyph_es.dic LICENSE.md MPL-1.1.txt README_th_es.txt th_es_v2.idx META-INF/manifest.xml META-INF/
  mv ${pkgdir}/usr/lib/office6/dicts/spellcheck/es_MX/es_MX.aff ${pkgdir}/usr/lib/office6/dicts/spellcheck/es_MX/main.aff
  mv ${pkgdir}/usr/lib/office6/dicts/spellcheck/es_MX/es_MX.dic ${pkgdir}/usr/lib/office6/dicts/spellcheck/es_MX/main.dic
  mv ${pkgdir}/usr/lib/office6/dicts/spellcheck/es_MX/README.txt ${pkgdir}/usr/lib/office6/dicts/spellcheck/es_MX/README_es_MX.txt
}
