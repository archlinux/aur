# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Forked from extra/thunderbird-i18n
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=thunderbird-beta-i18n
pkgver=77.0b3
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

md5sums=('036fac69b665227b1cb67f6a74b2950d'
         '3786a54ca3f802ca9750af8d8f227c55'
         'c897fbb04afcfc9091d6f547c8de3a44'
         '3e878e1e583439cac2d61a22da3ea8e2'
         'c1dacf97bff70c7c642255a5a58ee730'
         '11e274967bcd25c82d50dd8d495121f3'
         'a1ed904fd350d21fac6594b70495c63b'
         '9fb8851b1fe2fb2a4157b18664428203'
         '5dde334876809525c2666684764a593f'
         '5967a1ad0027da898ad29833e06fa15c'
         'a26719891e2bf812da65879f3c38e68b'
         '9dc3e6c36bc6556e698509e9f83482cc'
         '21669ca451c6061db8792f161d45ba45'
         '471a89e5e3293b288c1f7dab10ed5265'
         'b71d3818b47dc1f4f209e41d452ccde0'
         'da70553fcecb04deaed32e193a0d9c16'
         'ee23192a16022632067aa70c072f3b39'
         '5d536253beb6588c25e0349c01e08e29'
         '0dc3bb348cf6f78371d00228e823c182'
         '1e04b045f3cbed9aae480970a999a574'
         'c5f3f09eb741600fdb624893388fd022'
         '1f2f6bc4f35379a0f5ad67308174189f'
         '2c8052db4739a1f082777df4ba72ff27'
         '81488c0f31ceb6a719fe708bcca3699e'
         '0505da61e9b9d43a787628b2fc2f81d3'
         '26b7b83f68cdf4495ba3db74cf2f13df'
         '98a9b99f692f658f0c8399694838a697'
         '146c679a1d43ebb961c6b2e9b64fd3b9'
         'f491b6866f40371713319267a2b6f93e'
         '9ae4bc8ad670e73a466b3f9fac748170'
         '2d6ab4aca30d274059bdeae65f7fb9df'
         '3b94b24fa26ee24a64d80aafd9b80254'
         '1d512d1fd004ae16cb99d2f0c318688a'
         '5927f7a319f4581a0beb40948b587097'
         '6d2a29d7a5d6cc115bccc4f460c6c493'
         '13e882250a91af1a00b74b61dd4d6581'
         'fdd24e7db136dd847ef3c4ac8024ca5e'
         '11ca611abf6cae748ec2943a69c2581f'
         'fb2cdaace2e154ea89aba5e555db84b2'
         '9ab8d3bb6980444ffe331bb65033bdc3'
         '825a86ca32303fa909fc500692dbe3fc'
         '30b7b0fc23049c248863d84449e2d6bb'
         '7f576039cf966d8612e10e2dd35b484c'
         '78a0c029745f4ec5efeb543e83692483'
         '2cf7e1ec36bf4f05422bbf02202d7786'
         'fa04cc8f75ba6b43e39b7c758024e00d'
         'fb0188bbbc01ae440ae1fb8c26458d68'
         '564fa048c4a7caa5b7394367f7c66b78'
         'ac8d770e5f789330213278999b704c09'
         '3ce5de416da9aca36a5915e8568ace1a'
         'd75206995074b30e1b8b0269d53519e1'
         'aa061d86540c104ba3ce932fc21c07f0'
         '56dfcbf9495129c7b62d71c2f4d6065e'
         'a9a23a476d2a266d5f4be92a3ff14cc4'
         '35e10d3513c8e76d9221200c22bfec08')

# vim: ts=2 sw=2 et:
