# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>
# Maintainer: Sving1024 <piano5432@outlook.com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
pkgrel=2
pkgdesc="Language pack for Firefox Nightly"
arch=('any')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"

_url=https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi
_version=132.0a1

pkgver=132.0a1.20240915.215047

depends=("firefox-nightly")

provides=("$pkgbase=${_version}-$pkgrel")
_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'az     "Azerbaijani"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'bn     "Bengali"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca-valencia "Catalan (Valencian)"'
  'ca     "Catalan"'
  'cak    "Maya Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-CA  "English (Canadian)"'
  'en-GB  "English (British)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gn     "Guarani"'
  'gu-IN  "Gujarati (India)"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'ia     "Interlingua"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mk     "Macedonian"'
  'mr     "Marathi"'
  'ms     "Malay"'
  'my     "Burmese"'
  'nb-NO  "Norwegian (Bokmål)"'
  'ne-NP  "Nepali"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'oc     "Occitan"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'son    "Songhai"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tl     "Tagalog"'
  'tr     "Turkish"'
  'trs    "Chicahuaxtla Triqui"'
  'uk     "Ukrainian"'
  'ur     "Urdu"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)

pkgname=()
source=()

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-nightly-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-i18n-${_version}-$_locale.xpi::$_url/firefox-${_version}.$_locale.langpack.xpi")
#  sha256sums+=('SKIP')
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=("${source[@]%%::*}")

_package() {
  pkgdesc="${_languages["$1"]} language pack for Firefox Beta"
  install -Dm644 "firefox-i18n-${_version}-$1.xpi" \
      "$pkgdir/opt/firefox-nightly/distribution/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

sha256sums=('18125fa9b5275020686c1c6a38663854619acc30f6cb9401eb763a17fa447bd2'
            '7cff873619454a158ab4f9a43dbfe4ccb6d16f340e62218d3a7671d36ad1ca50'
            '1b32bf995aab94280fb87c49a7064b09e765169f294455394a08df6b7ea4a715'
            '23fa49593804a2686d747662ae22339d1faee15b90c1f7163c1df4be65dce685'
            '0327b7bca0af88150aa555f8bb9e6176eb725123bab9481dd7654ab78af373ff'
            'f545675eb1acea68d3715ccc8aa0c56a74f03932027402a0ae20d4361eb2bb9d'
            '9c3cec76ca61d8a87e4ba036a6b21a3c1ae43c597e5c304f3448bc87912d2d43'
            '7f8f075736169beeabf2848608d27801319f603188b890222b74c43d1b511604'
            '1332816ea71b952af3c54f8c4c32dc1dc9f57f832cf799366c2042db1096d771'
            'f04f5cea4a3d8a736e719acd5066f55a0c657c32dff5bc9eab12dd4c99c9b67e'
            '76245b7a28d2517ad65c31cbf4614eb6d7f4dcdb93cf3fa1f219e47c506803ba'
            '8821f7cacc370600ca9e70fdde404e237a80e5c02da5775925c0440cce2e1f77'
            'e4b95738873f88f4c6ce1d470c3ca8dec3a89ededc266f2c0fa146c65103042b'
            '101e448c6cbfa9b2bf43d7579a7cb864ecd62929d896a590a174ba6865a099d8'
            'ea9aff9b9dc760ded1f9e808dbd489f45eba5eb7aa90753a475ef656b00499b5'
            '231bcfa845b32d74e1459d4989df61e3965df682e67d4df4526a6da1a18613ce'
            '06a723175b85db05fe6df60391d65af46da6aa2c0ae117306e714f33122cbbf5'
            '9d96f7e8a935f423d6b5c3a89b46fbe9a46567063d514ee1ffbf44207e59e3fd'
            '8d1e1a9d218c2c001dfaed97a8b9dfd2360c21a77de4694f3d7a32acc4aa778b'
            '7b632e9ac218a4f909c2b233547de4f244f36821d73887cd25fc948c9cacad95'
            '6ac495c0330243a9752dafcc68318bcb1bfa79ef3566ea1d3bc34d36305e0562'
            '5bdde058bfdc1e692015901abc612e6fba3d6c8c105af46719eea4cca82ac3c2'
            '531e21497c2fbf718a93643d69ada340dbde5a66850a5ca500f3b54795da931b'
            '6b3c5cf5d407b5de5a535187bbc4cb9c828baf052c9c58e25a1bc8e227f78c3e'
            '33cc83d10fb938247f744574196cd55319c217dcf6d9e346d3e31cc4c2ea05f5'
            '3df6c7d7c3adba88bf2cf91c44e182407277bc6a320d5c78216897e1cb68afed'
            '352166a9dbddf787d494e03b1e78f68ba9de03a5d180993f8402918f824bfd7d'
            '4f09f955d8bb8b5144c3f87ea9a4a3a5eb701b1b106911f7c58370aa23a19082'
            'deda59469617f1137a9761430373ae5585ffa97fb565063bdf6663e201ddacb3'
            '3a7be7f4eb4f82d3bc0528e45a3fd303483418c8a54780c81fe20412de050223'
            '5bc8c9fd0fc85133945c5d83018088c7357720f70ba068e686343edf68ecc94a'
            '96c3a20211a2d3b7cf50307a9c01062d34cc3be31b040fef6386b82ceef1c5d9'
            '40b2e471830bf1b547d390b2cd9cf3040ad2dd52c2c1b0c74c470b0118faf1cd'
            '700a5951216e7446ab14f155f60f903e9380fa3ff0f04fcaac5ae7773727268e'
            '7ce3cd54be017feb81962c8f1e6612828ff24c5d464febcbf44e45b77eacae3a'
            '868161171b46676cffcfaf54176abb0fbf5de1e00f99ebc78ba7ee751c9f7d80'
            'fc3e926abae421f369291ec47cc82692fa00b26ec882df6217bef53a6e3cd911'
            '4d26687f65263bd6f384fe53c1a55cbed4406992d5eeb859325b735e4095459b'
            'da1aa94a7b74578457eeaa28f57ee6297ada652fc819b569a085d2c4e9fcbfcb'
            'd91a2e79ec2772158708749c60b553c4766b074095d77990e7e27951c554d791'
            '24c0cdb049fe352d394880af1fb434413a831658e8eaf9450173aeeaf504d223'
            '4bcb732065d950e3407c43f873d0d5e648fea5cf916dd01b96bdb33aea65616f'
            'ca3b3bcc52a05fd0d34e5329043ca20bed62b66e730970ed0fc8bca65d18e947'
            'cbc51d61a9a3b5c2fb6cd12e38fc9e115fb08dc7fabf9d3d1316372d26b92032'
            '0ebafe073e604aa4b91721a88f8e0c6d3bb00c25178b05e4f6bf1f263616218a'
            '9e719b498386c8659ea92840974d4d1c2617dfdfd63333042bf23774d34d3b78'
            '72a7336078166a58cf786addc42573198630c57a91d126d1efc81fb78f79f47e'
            '035c7571545bbba133a5d95a86b73c35a22a95eb88a5a7cdbdf186bd575470e2'
            '2bfe23b5edf0010d0967ca5598e8ba5bac0d5c083873173b0239ae6db5691900'
            'f00281fcf4dcbd9dd48143a5ce5088551b99ab5b82d481f25031763f23a474a1'
            'be81796a1bef68b46f57f3f61c4468e47aa5c60f7800f049b6e3377d1ee53d60'
            '2369fd762ac453db421724b4a0d2cbf0a3814a107c92a416a261adcf38d98e50'
            '2a592a65f6419c22a3631fcdd6aee0c683a135618aa63486913859555cecbaf4'
            '9398b251f96797ca86b432d4209c72807914c147321cee9f1a05d8436622e914'
            '89a4e43837ed9b1939a9339356a47b37d1e5714d1818a63e18e59b1a5e95a28c'
            'abf7c07194a61eae82f393a1451a8ead3fc7c59c6d1a11fbdd4efa9834cae1d4'
            '25488482a1b49352a282b265e56415157a3e576a0f8d3488ff87ea04492da7c9'
            '3186941f964cd17c958ea8a4dd8d8cf74aca6395c970c18680c4dc7773a2e14d'
            'ea24f472c7f89b2ead6a7ebd5a984d8eab001b8b0e133ea9f0ed496ff8b3e961'
            'f7247164b85c7ef4661a8c9498da6e975683102eda0b1ef4204f2a9eb438363d'
            '2a12bd6a204fa02386f52e83ba3c11d73ea32d8037377e261c9e9a84aeeba37a'
            '2db96a51d62a1ef88ddbac91f03ea0035a0bc88f3c325e122e1e5043c91b3942'
            'e5a0efb1c68d5909e395c228de7e28a6d739a5d013262a2f7c7da98c2af3a950'
            '9740952eaaefe65c23c9ababceb0fdb672419dc4facd59050bf2c08a99709ecc'
            '97b2d56600a3dc6c641ee72ca6155f31dafab9519ae691859008f9645b0d3614'
            '483e5c06c5244e9f3d92009a2b892682c27c2cc84030d2fb7030f58c310c0f48'
            'da14560ed1c3a69da8630d6c5706df459db8bf1c1bb2a3b6afd3d41b95a3ca45'
            '94a73d77fed856fbe7e67abedeb4171abf46bd680a7e79e42a963a879a7dc604'
            '000ff44fe70fdfcd5bb61b891599f7c990e4f1f893f532e15596f4f15edc439a'
            '618fb73f36cf7217585fc9067c5abd026dae852a63c8ae38fdaa24c8a1b9a961'
            '4c7230c7a66497944517aa923984f7edc1c55f9d1733f1c811a9cdf7dba125aa'
            '01918743e7d66bb337388f8856e6e9cb90cd89719465f95f11aaa152672db1fe'
            '1ec5b2b6fe2d183b35419d91478042956422c4e2811a02f6496cd2c531aa7eb3'
            '7cd57a4b89dc2ac665b86d1bbce81c55eed6c136886636f2cc090a6c5ede117c'
            '47688118e9fe19434b92f97f329d05da2f00274ba2637fda3a4b5860b95dc5e0'
            'b0449a96bcbbe26236cf0106d9d4a773bc68c1cb99ca2a61a42f6b2a1460c4d2'
            'ddca6de77a4aa61f29b549084238a0a9ee752b126e599b6d0531db3f2ce77441'
            '12fb88cf8ab66ef66b4994bb81008335ea2392c510bd7ce0164faf6fb6a307ce'
            '93d84922132c0da4892027734e3cf2ecb22a361c07ac5971030ca05f1e6f39d8'
            '7bd102d7ae6d72bf888d7d5ce782b220f61012f8f693a65b6abfb5a29e9a91ba'
            '0e1aed2cee9aff0e7582efc04f5270ab5647a87b3fe504e67094e22289d0eb4e'
            '9a24cc5e990a393f936b58a6c456ae6b64cff0f6e1c6dd2f86c0273eb6345185'
            '1a064fa561fc3a8a20f51a301214c9a8f46f614a1a08c769ec010e52f0997437'
            '4eb1e402b56d34e16d30040a2d8bb59ce798a25ca04848949472198a526c6b25'
            '5e3083d0cf49ea09fdda0de2a1feeca8b86f4d77a35d3ed93b1b66588a3fd81d'
            'd6d26ea8f4b88b5165ed626e944d883f7c3fd5f65fffbd0c923cd0a8d3b4bbdf'
            '26b3c46182ec663a5eb1c560cc3002d593fdf3f1ac02a3050c8122ac81be139d'
            '36c283c21fa5b157db94f8aae1a9822c3a3d20624d4eab6e6195b87880764da3'
            '9e24587ef3c47c09c19ecfd7255fa51bb221c1c85fa601b04d0c1f3ae79cd11c'
            '68d4eb2c40c80cdb344cd2152523b63ba6084d32a32dfcba8203df539b7d75f8'
            'aa797870ec27a4159ec7426deefd1f8d7c9bb13d30ec557f24a2df6b4958b345'
            '019da0900cabaf2768b1a0806dba221ea2cd2c907d4380c306ab6cca378d2a8c'
            '9cd49453d8e278cf9d40ddea55e9c39b45b05ef51826fe96e21b8ce8de9210cc'
            '9a11550ce1b607e5af0b9bac4f90b0d3170510a7bc9f6f04ad575453012cf8fa'
            '1a40284fb6a2abc1d19a7f11376701f95951fa18a6a6f2c3dca0d21b34e6e83d')
