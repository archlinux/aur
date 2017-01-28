# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=fossamail-i18n
pkgver=27.0
_nextpkgver=27.1
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

sha512sums=('0bc892cfaeb0604244e91592844969f3c4457033132121f77b586a30199005649ea61c97ebdac1fd10ccc0108dffced3da319f2a9b33a9fd76031543c256fe22'
            '19d5fa4c979d95f35bef839bde8fe50f9c8d603222952068fbf800f5b975a9857c2be3a9169a84693c71b23a8ec4eefc8d1d765d05c4d3d8c36fcbf22bf5b837'
            '706f9ef8a269532118ff2d43735af363059f3852ac57d58cf4f23f8ad5618b722a16e2decfa1c3d41d24f13833f4cd7fe97fafb30dc0a47b45298eeeecbe2bea'
            '38d1754219f78e9a39d5f9a5f86d223f7e8e8575339f0eba6e18ca0864f55687da24ca1195a76a2ffc497544f5e76dc452e969ffb8666391810c66c74da2dbf6'
            '5026d2e36c745b7b61988d97ecaf3a8b35c13668fea6022b04b602140c67f1d3a33f515727a81c98655b651d4382fe80681cf34925a02514764047972285a0e8'
            '9e4eab095169573d6a38a4938adde88a4a423591726c507b49c8303a16e2c248d69fd08ea5a961da125dc90b5243eb6d6cf4d88bfadba2820c5be1e200a74dde'
            '1daa2f90451755af63dbeab98438306988f64ebb8ab6b38d88cf0862795fcdf4499eb4d69a8c77eb6bc8f079b056ca3d8d41703101a1e829d25048a06fa64bb9'
            '0e139aa1f1246bbdebe627044e0c0e8632425e877ecee04c18d207899fc7ef890f294077f13fbc535df58808d30cfb6c848141fd585d841b0131b7eeb1351b95'
            '44c45f73d8de082045d9133347c081d55d0e60c2195856683dcf59672b278e8962c7e2c46bee12abc792285b684065adc22d554f0851bcf6bf1df8ea970fe031'
            'fd78be39864c483110ba83a03762fdaea6005c63b950724001b1912afd9ef3b14b112f6f382b0ade2b353271a9c882b50e0578038ece092010a1d64e27301cb3'
            '3e4a8739bd54162e337061b9e65a8faedd4d0d197b97da4e01b54518242000fc811b4fa87228aee870a7f77beaf4a11a35706fc70b98d2a4570ffc3ac74d8882'
            'a1c14267fc6f510283f997095102483e67e3ee9a03749b897f18b6f6b402f772f3b7cf1fb014e70c80b0406edc3c943c85f2063f08a5980d05be3d31e0a5d9c7'
            '32f4d10e0b61815a1050bc01c2035196e73a3c3cf82f51315ab92f8605bb5cb49142963356a36f0945bd3a688e590f4e96243691f7e623c634d61a70a579fd5a'
            'a38b8df983d43692852d86f17838fde009bb0a766c4951a1055b92e93328d7863802e1465922e85f9cfc13d9d7ddbb2700f8d9ed773f31786c8a374e34130645'
            '1233ba15f18edaf629cf4406659143d7218fae7da7e2836c1743e692fbd002a49d12610ac0943f968b35f9aeeebaa5b04df6d36a5e2b024b9b439ce6f33e30d5'
            '4697a74f615ef2d4ce3b2e85bb72c59609dbaace96a088e47dc58650eb450878c8451f13115154b3423ac2477cc2ddab02c2c5abb81a0c0dfcb01d81de34dd39'
            '36527ff0ea0b746cafaa07bddb04411ad67b4f351ed4ccad7e71ab40884b737a0f727f9535794fdd8ca2de8015702b5400dfe265010b360e1a600d46c69e0ae0'
            '3b4dc7abccd4c53bcf10d07f3635ee7ba0a400d7ce964b9f74c9ede29a621f843efb4dce587047922e5590e48ae5186df7e768536f297ef418c8d3bf744139db'
            '20e01351aab3233977fca58819aa6d3ff79085bb8a20ca53e59379bc71ff58b4736fce739109648f1725e9e61fc92a59113d003e6ad7825e98625829937628ba'
            'a2f087eda9d7a8b1b657730b177e81487702006af2dbe7ecd8dcacf4f8416a5eba82976cf5c641a1cde97364bb9213cd3c58515d8d7a2b987cd4494d51afd1f8'
            '8676f2ae017bc4a8169474fb41efe8a1006fe18ca2361f8842e04049863b09f57f59ad6c2235024e161793241bdf6911d72041abfdb120daf59373d3beef7921'
            'b0c3c765f5d06cb073a7052dc52c9eb2eeea1092fd0ae7849eecaac0ca25c6d2409121e9caea858b3cada92af2e4d19d0cc1c8881707a7bb112ebb44db5dc251'
            '668824180f9f59d9efbe514d4eab16c9029e8b0ad79ddf9b021bbd5d08d253d828fcf72be00d7c045242c137b16b4e094335c28a3d2634ae3db10df04b6d6759'
            'e370927acbb8f0842732de4d9f3573d0cdfb4eaed7b716939b2c5ccb71aa151f44022c4c1b1617f8923e64337104045b2f5ebe757822c033dd91803309a9d624'
            '527d41fd9340e5921eb58697cdfaf63b11521ceaeaf83741818978db4e31d357a7fe73a73484f74d409ded7584fcc2545b123460a579998b6f792908b76d87f4')
