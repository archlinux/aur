# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Forked from extra/thunderbird-i18n
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=thunderbird-beta-i18n
pkgver=78.0b1
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

md5sums=('446cc6feec8179cf753c37060119b306'
         '09ef1e3e3cfa6eb218a5169057787241'
         'b8d086c6abe7aadbc776da8fac979296'
         '0abb56a0d60c364782dd117f8099f428'
         '4ded91d63c885d0214691ca71fbbbf67'
         '3699619bc3f6df36517a26b12f970034'
         'f5ba964c43fe830902ac2717234e5a1c'
         'cdd6ca44752ff738818a9b6c3adebf3d'
         '70027ea3ae92060a86adca258fbdee21'
         '8bd2cff93385f576159d7d56ee3fe175'
         '43106e293114021d6e57762338cecf62'
         '81a90794f1fc2779d03ab45bb1683669'
         '90db4cba79f5aed5e57acbeace6ceb90'
         '4398be55c4fc3131d3240c41d390a223'
         'f95897af68e36f801b5fe12ae2eec307'
         'c704fe06943ac3ed38be3a141c106268'
         'ecf444cfb6a8398cbe1b4286f4e3b549'
         'be14adafa6493add048b57e0d7d7935f'
         '7ceb19f1069a643c917be6600dae5caf'
         'd33fb3a5077033ef9ae2404bea185747'
         'df215aef8c312e18c89084efb55d457c'
         '6987d06b78b4f4f3a5d8859721078041'
         '5001c28194c2771647242dd8f485dd66'
         '1d473e34a47b0f010e10840a47863317'
         '3a15d9e4cff900f0b2bacdde187499b8'
         '5922b902d387330d14108a9a6f3061d6'
         '609fcad9b74b7e1cb889a5aeb023063f'
         '7ab80bf99371f93390f9c147ca984e9b'
         '414935bdd5ba263fd2e57836401f268d'
         '38ce2482876e8d4c8f3e98fcf6a7b629'
         '8716db40d93e66c19c476b5aabdb2122'
         'c6e13ccfa2e78d1e4e37494122132075'
         'e129bdc1b924119a7a7a6c074e7825fd'
         '8ca3b1f79f9806201cc7fb2caea28c46'
         '7b7cc8cd62aef8ca44fdc260fa2b7fc2'
         '76027be3c05e28cc2edd8db44a5bde37'
         'acf5b2abdfd80b9fa753aceccc060d4e'
         'ef6a771451784851db804a8e2ffece42'
         '57ac10ec03677cab6b0f61c911f24ca9'
         '347eb5bc66837888e6608e9dc74e66c0'
         'be581369f43765a7c0c33f2b8f6f997f'
         'c173b8701b6867b7896321acc0d567bc'
         '0f9f881cb9f2710e941ab76ee9d24bbc'
         '83c4c14308375a3860de44b484890b78'
         '5168ae4340fedebba23a66826a2906ce'
         'b6688329d67bcf225811141d3273496f'
         'ea3b088689ba3a1fc1883c240b405368'
         'a812c4a498d1672b99e22176b07882e3'
         'a963fa9f14ba4b35caaf70ff49aee5dd'
         'a0b406178fc1b0d0261870e44d7f3ae1'
         '656e745140c4697befb1b40352939ccc'
         '88f09a38519c095d48e6cdefe7ba1d64'
         '17e5f3a94b7bbaf579e75f0a8b104b41'
         'b138c9567ca56882d74b3ea1e899af70'
         '764aa84756da95f6888cc4d8776d9b3c')

# vim: ts=2 sw=2 et:
