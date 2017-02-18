# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=fossamail-i18n
pkgver=38.0
_nextpkgver=38.1
pkgrel=1
pkgdesc="Language pack for FossaMail"
arch=('any')
url="http://www.fossamail.org/"
license=('MPL' 'GPL' 'LGPL')

_languages=(
  'bg     "Bulgarian"'
  'cs     "Czech"'
  'cy     "Cymraeg"'
  'da     "Danish"'
  'de     "German"'
  'en-GB  "English (British)"'
  'es-AR  "Spanish (Argentina)"'
  'es-ES  "Spanish (Spain)"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'hu     "Hungarian"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ko     "Korean"'
  'nb-NO  "Norwegian (Bokmål)"'
  'nl     "Dutch"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'sv-SE  "Swedish"'
  'tr     "Turkish"'
  'zh-CN  "Chinese (Simplified)"'
)

pkgname=()
source=()
_url=ftp://fmlocales:get@ftp2.palemoon.org/$pkgver

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=fossamail-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("fossamail-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=(${source[@]%%::*})

_package() {
  pkgdesc="$2 language pack for FossaMail"
  depends=("fossamail>=${pkgver}" "fossamail<${_nextpkgver}")
  install -Dm644 fossamail-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/fossamail/extensions/langpack-$1@fossamail.org.xpi"
}

sha512sums=('c37b2dd34c8e890b840e625fb8b6c0149bd4503595b2107b5bacf0997862c19c4c893101bd444635789f7d05a7b91196a6aaa44e1886a8b347a590c4d0bd97dd'
            '0120bf37e98352e4c7ab344ceb45b0c51a46a992f59fe8bb69c5a898bbd5f5506e7cd2f0103e6b58198a4ca2c5aa8ab76df6064f7b62ca1450016e5480823b05'
            'e03ee93403e6c024a01c798683a286d29e123912c9a6a3941f704342855ff7ce3cac991575a54a52a7066f694a00dbaf1753972c0f644b5f9b537a729eb16ca0'
            'abb42036a9e2d3eaaf90001ec6833653239cb9d73ffc0c8d7d9204650e41855dc89590cc672d6117a29551631ee3cb83febf59277bce4ccbb93aee8ebc8e94e3'
            '36abc69df5bcdd7527ffa45c4e8261bf53e2ad4214780c87fecb3b0467499416bf079b665f518babb5d6456b33398d4700d71bb5908d12239f729bbc4281cbb6'
            '6ca636e1b6c232ded4abb1c9c2296cac83fcce03f40d933329cb87e257feba14d2f6aa5c51c57fe4037327b5cd6bf9c568917104a5bfc60dc2311abac6b382e5'
            '939f5e658611a7ec38b8cb7b40b7c4970d81fb895358f4a374d491ac59cb561684da995f78f3d8a3164707e5059cccf2df8e383f06a9243fb615f329399a96a3'
            '6fefe0e509827950bc5e54503ced7ecf17ce564dd00865f25846afc3c801e3a58f281507de0596cef3d94b09ed30dd60cfff0ccd97f852d1aec8292265bc01a0'
            '6516d039489b06e48cddd99c1b969e427cc65714a8bfab272dd6608a00e9e467275fdb4c3b09099f003f76045c89f5be1ce6414f4b2012ee5edd603df4cf2247'
            '15b5b27bfe7cf9fffda4ec0f01f56673e54848ff32c1d200b5d1dc53e3d2a0dce3f36042e4316b7724e3e6d9e653f66935ab199bb29ec8e8eecd409959d981dd'
            '2fde325d3c260c28420612a8528fa2f6c959b80219e4caf4f1dec80c137834c929b3c00a49080eb3524ce1146d50145075716eb1b4eed06b5eb691d94a9c8799'
            'ef1f2a94a87def51cd75ec7a5ed3410931bc9842f0bf8425041233e992d910156f34e14c5d868d7cc47f579df89ad33e9ed4b480d9dcfffd53ab4b3e987279aa'
            '7a3c832e158fc21e4abc779b454df492b806df59503d803bc3de25d4f7c50d4c438e14827d769fbfde6905fd6da8a03a7f424e9d9218606ef8c62608d6f14513'
            '2759d691414aceec8b5dad1cece476f2fe868fbeae0967578fe043ad2b390a03507583cb528762ea0d640c9fb94ad54b5191c154018b49a9549962bf745a01bc'
            '77edbee8103ec6dfc9fe906668faadab3dea88ae9d06c94bed6f26a4a5b2e511b8e9ae7e9742858effc430ffe24aedf62be1c89eae4b3ffc0f86432e35daad59'
            'e74df1882c5e3a17c14962c7d965fbda85435be0e06833901788a52eeca569585a43a0441f1111aa57dc8ffe5de99639fbeac450c97b22e48edd960bd0d83aec'
            '59042e433b598af107c624de1a0c7e667c233a21742eed3f12b66a8d4d6405f5563bda08cc0e96ece33022441a93f62acc1f8a184a1039db5ea4bbb336f3a0a2'
            '8300bd1976a9655b3d5f9c7bc0d400ff2846a58ee1afa030f9354e9112a19955e3c0a140d75b5e2db299a2a204412f636b68be0e44f111817acdab49b5b7b027'
            '092d1e5a010b0fd43cdc41b8bf872d0f90316fbc904b4fa5af5d1659b9714b69498471d92823f1265a837ec3ceb28ab616390100340473ba48196c4df44decb5'
            '21343def5735fcc610ec0865737f7bb23d1d3584fb041fcd5a7691aaa1395037766ffc1915b0c66f64c958742411100dcc17d0c13b7fd1cc08a5fcb964645abd'
            '7cb7e38f41617350e840b319eefc41740aab0e15557caf10a8ee23f1bd3e27945036d65c1782f59a64553626210a4ebe80d201ae59963780210f928640ffbc58'
            '177a20ef2036827cf89eb2b3edb63fe0eca803488ed9ace68053d26db507fc43050302ce5ffad6aa266b7c9d8073e2f1a19a90f280e39b0f84566b7b649f7dd7'
            'c42dbe745905c35da1510d02d0bb68361d2fa6916da511fcf590746ffd7540c00fc967d13734b880e865a0b8e48a10d192fb1edb3ea4ae5660b1f3701d746f16'
            'c79dfc872adeaf6c678e6be9bb639b46106c32e073ea70565ab9a802c1274e57a58f9c11c28987e9493dc15f17a1fa081e6011b21768595894060a78606db53c'
            '493c7b21b7dea8fab297e5e3213ead5a493b9763e5ba96986916dac2b048816de9d8ca85e4047b622b5bf61e43a01a1694f4971a2944f5183a4629d140157679')
