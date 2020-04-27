# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Forked from extra/thunderbird-i18n
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=thunderbird-beta-i18n
pkgver=76.0b2
pkgrel=2
pkgdesc='Language pack for Thunderbird Beta'
url='https://www.mozilla.com/thunderbird'
arch=('any')
license=('MPL' 'GPL')
depends=("thunderbird-beta>=$pkgver")

_languages=(
  'ar     "Arabic"'
  'ast    "Asturian"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'br     "Breton"'
  'ca     "Catalan"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'es-AR  "Spanish (Argentina)"'
  'es-ES  "Spanish (Spain)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'he     "Hebrew"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ko     "Korean"'
  'lt     "Lithuanian"'
  'nb-NO  "Norwegian (Bokmål)"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'tr     "Turkish"'
  'uk     "Ukrainian"'
  'vi     "Vietnamese"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)

pkgname=()
source=()
_url=https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=thunderbird-beta-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("thunderbird-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=(${source[@]%%::*})


_package() {
  pkgdesc="$2 language pack for Thunderbird Beta"
  depends=("thunderbird-beta>=$pkgver")
  install -Dm644 thunderbird-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/thunderbird/extensions/langpack-$1@thunderbird.mozilla.org.xpi"
}

md5sums=('357af0e24691d42770b10e6c196dde5f'
         'aaee279b7aaa3eff8811016332c451f4'
         'c271afc80ed0dc972b6480b99c2bed73'
         'c341dc892cbcc5ecc8b48465c682df5a'
         '4475b7f8f3d5c289f910ab9412607438'
         '7b1dbc258054c36961b04e910cf3eb79'
         'f934d6228c789acd90c7dd5e83fd966e'
         '0574830b842f9c2c3e81ab37cf223109'
         'a1aef06fd87b604296ad9ea0a22f74f4'
         'd0b3a69fcb802ff3deea58aec0277de6'
         'b321288c77040edf5b815d3615fb26b3'
         '17e2b76bcc380cdc03611727564a8535'
         'dc0d743ff67eb71028d3e109b013b48c'
         '1ac6c21dc696af80d0915bf23e5f93af'
         'a9e3284462971c33d093516633852435'
         '1b630a2b7ac5105bc02750aeaf4e923a'
         'a0d95b85fb37a11af89afe95902d8485'
         '2399923ab6c4a7f1b3395a53c3e83136'
         '177b173adf36870e8d90a598bfb7eea0'
         'dcc0d4b6b3c9bc74f628e314c5dc4ba7'
         '6c8e26981160a75074090377c523c0be'
         '35c462a74739d162ea78b29406c163ff'
         '6569964283003c0960f73a148fafbc58'
         '16690f60c1b0eb90505e5beaf3fd15d1'
         'cea5299aa381684237070a003401496f'
         '013eadcae0fb6e2a194b3c4094ee6f47'
         '7fc30cc1c3de9867f6a33a3be898f398'
         '39a7c4f7a0cff18ab12900d171b5c046'
         '7bdaf5617ff8e5f9caaafec9bf64e04a'
         '8dc55fea3cdb9021bcb3f01eafe1936d'
         '444e32ac2c6630dab56f062163a50411'
         '09fa8e910f4da290b6fbbf70a846753b'
         'f93a24aeed2bff9036288929325fe360'
         '9474354bbc6480769be9955bb02b69a4'
         '03b43347063db2887ae0ad35a5e45b78'
         'acda339519ca4feacf417f6f78141080'
         'a690fcec3d553bd3c4badd59d01f369a'
         'f988055f01817673ec09e1d5229061b5'
         '7ebd7fad5fc897f6c4242c71e7c5be8c'
         'a1532d52fa04f5a9025cb39a2d5355b7'
         '0e68c0d4e1af52f9382573dd6720b0d8'
         '9f1ed04cb5508565140c76d9cab8efff'
         'fb643f3d0806cf1e020c5ea21da1d6d0'
         'cfba4a9c297bf24217fe83a53e3783d8'
         '6bc5bd28963d02a01d4f64adc0919c20'
         '5dca4b0733591576d1f9450d886f7fd3'
         '52930d70d7e3cf8b837c41a724ced7fa'
         '5a690c465b9230fc4474c2076119f24e'
         'e6ce555104c2d6700dc6416badc33e4e'
         'dc320d9191dc799891e7c3d994663d0a'
         '790ea7d471915d834ebd24ee850229e2'
         '459b59a5f7ea4862b7129ae59f41927b'
         'a55b74f47420567307499bc9454c3d52'
         'd54be1acdee556051a60e9b63ee886bb'
         '8af2bb26394ae34fe9a02322bc8fccd4')

# vim: ts=2 sw=2 et:
