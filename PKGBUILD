# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Forked from extra/thunderbird-i18n
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=thunderbird-beta-i18n
pkgver=76.0b3
pkgrel=1
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

md5sums=('5646886f475212674ad9e61738822845'
         '74846b3eb872fb492103e406fc761f8d'
         '788fcd4a0f326a6b5c3d2acf281c06e0'
         'e084fa0884cb42c9cf254ca7a0f89259'
         'b9120085218cb9c214fdd8977211d398'
         'a51939968e41f168e2efc05a3a50feab'
         'aa4b5a0d445625e296f63e455cdfae2d'
         '94ad0eebd7bdef52241453691b727321'
         '55cc32bab0d9dc07c29b1cb8a6f3dc31'
         '499283e20b520a81fc9ba7e96da14752'
         'b89c34bc62a66373e4fffcb40cc38e24'
         'f0d654be98a125332062fba2c88b2544'
         '2f54f1ce611252c96779a21088f932a8'
         'c1a837c126f2806ec1dbb36c5cabaf70'
         '68b3cc1f1fa2f20add2c973cfc802a7e'
         'e8d8326aff049ed7d62a17137b1ef33c'
         '93c7ce6c2ee16051b21f28cd6b813fad'
         '3bd9be6b81287c5e212a0c93ffd96306'
         'cc46add212d77862d497dcb3153696b0'
         '9255e1c7da48400d7275774d6c493c88'
         '39d0ec8dfbd65f9d4e4e4397ae9d699d'
         'c63c736263be7c5fde1c10117443986a'
         '77e0a42aa6a5d51dfc6c64da5310eaf2'
         'c397506818a29aa63385a9b8706e4062'
         'e50343bbe9212976e4d9ccc8b46fde9f'
         'a7b4ced3c0a019927fd4aaafd4a4a182'
         '20fab2103bf6fa381611eff689324de2'
         '0a27dd39ded65a28e305ca135f737409'
         '604e81a13621710ad20d389852c2ad49'
         '96d9467b69beba5168c3069e20ec7b1e'
         '150b1289503434f01feae361bf0679ed'
         '3293de30108b5b259d0339025791887b'
         '45e9cd704ba35cb3a05bed857cc42f57'
         '746346672a279f687b2b9c97ce0bf3b0'
         '5e45f9afc0da589285be59f6eb3c4ba6'
         '9d7cba23ad6cb8088311affc94cb4338'
         '6c9c048501f51877e1cc38cafbe1e88c'
         'fef29bc2cee86f0850f0c5503dbf2b12'
         'f2f1c371095e11c893399f303aced026'
         '8446112b071ed0c1cb3a55af1972125b'
         'ae5340ebcd673f9d5149f6996a420a0d'
         'd10146d38a031f8c37d21cb6bb339cf3'
         '13bc7de41641f60eb36e97c615e10135'
         '249f8c1420f972e94bdbed7d311686e3'
         '279011532340f605144479fa21aa8dfe'
         '84aa64b54d71f0052db063c989452377'
         '7aadcb927bf56756ea208cb1db88603f'
         'c0e714b18f240612138bdb7cad091e57'
         '076b8f98cbeba38fee48bc372b8845b1'
         '4ab6b06929b32d08a9b719459df1ceab'
         '29e4446fac8daeed8516804566b5e6c6'
         'e1c49e0bee4b03561f544600fafcbe3e'
         '2973f86ce42aed572d6c984f1694bcc2'
         '13b8ad16e25efd36fe5388a495e4b65a'
         '90ab5584c2b0021d4ae8264c820fe921')

# vim: ts=2 sw=2 et:
