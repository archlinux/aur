# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-ar
pkgver=20220502
_commit=cd92368c48c8e1a468c112aab30771d3c284b0e7
pkgrel=1
pkgdesc="Google Noto TTF fonts for Arabic Scripts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-emoji: Emoji characters')
_url="https://github.com/notofonts/noto-fonts/raw/${_commit}"
source=("${_url}"/hinted/ttf/NotoKufiArabic/NotoKufiArabic-{Black,Bold,Light,Medium,Regular,Thin}.ttf
				"${_url}"/hinted/ttf/NotoNaskhArabic/NotoNaskhArabic-{Bold,Medium,Regular}.ttf
				"${_url}"/hinted/ttf/NotoNaskhArabicUI/NotoNaskhArabicUI-{Bold,Medium,Regular}.ttf
				"${_url}"/hinted/ttf/NotoSansArabic/NotoSansArabic-{Black,Bold,Light,Medium,Regular,Thin}.ttf
				"${_url}"/hinted/ttf/NotoSansArabicUI/NotoSansArabicUI-{Black,Bold,Light,Medium,Regular,Thin}.ttf
				"${_url}"/LICENSE
				70-noto-ar.conf)
sha256sums=('4bea973b7dd21ff9afe22b2c4463d2a634cd4ac1f8e1a60117a16c89f635ce76'
            'adf2db4764c8149477b6af38793fe2501fc2212a7605c74c867dcc60e6b3d75f'
            '19c83bbaa3406ed2c29692088b211953b66ffb149eedabb7d57aa9b796422f2d'
            'f76b19aae6f62abd987fed9f602d9069280e30e781bc38a7e06e891c1062d9a1'
            '3866bf19fb27fcea7c292c42ec651d9aa0ebbfe0b2608507b0adebd0819960af'
            'eefe7969862ce83380666572ab05e49a0fbe4e61d1544352e7d7275d4651eb2f'
            '7432f2350487d9f784b47a24526d9fc48f2712bb6c2ff602898b104b0c26ee80'
            '1cdc687b87ac780b3a2d7d1a91a059ceb089b938883b0f8450f1fb028cbf12bd'
            '2f4b88e6ee50fa82c617e2d1d4ba18281cb1c6cd71c3af3ec64970c23995db4b'
            '9bd066c32a69b0c38d76632b23a33aa1c3ad699e946ebfb6baad0b533dc4c56c'
            '84a61d3470b59bf88e5698f45bcd09233c33f4b05995f276f0c5d93658570a7e'
            'b65f04828e1d8349d3421b9e1928ea7bbd2c4753824e93ecf908c90254cae3ea'
            'e13ece07a2ae6fd3e4a528e1b0213fa47ad25d37c685da4320197bac665531d2'
            'ed2711b387750ae991b6a980b8dd16fdd65e6702b97e9f52adf3a8edf09ef4df'
            'dbf3284f47fa1320f3060c1af26a2a1f13e21423ca5c5be5fc6f8a063eebf8be'
            '751d14b3063f4989c05645dacdb99c8b8b986b1927efd31774fe46f4d25dfaa5'
            'ceea25b464a656dc3b26849bab9356740401af62aedf1bfa8b7f0d9b75925b1b'
            '4a640ec110b9750efbcec8d70c473def04a9f49b17643172c2f79e1c73ed4a10'
            'e76bc15875697b9818f680bdb9294ea193bb1ff7557e5a8806657eaebacd2086'
            '84d407d6f2a597ef1baec7398ff98f987698a66e5d734d2caeaa3d509e8409fd'
            '2f0cb846c339314c6751609df8504de7a09fd871cd77b06d652c87b26d304b9e'
            'b3f0fef838458afcc43fe2b4df829c258f9e7daae1cf18853f7d21d5ddf607dd'
            '6c3d881e7b73affb230d20e77b44a0bd2a75ca5ec875a4fa00979ada5c989352'
            'cc6989d9f44c5a56d950e0c616319b7c14d1cf6e3656b6cfbc489773832d5867'
            '0dab92d0544f7b233403f14b84a663bdbfa746982eda629e7f4f9ffe1b036feb'
            'e9eac74b4b261bea372d464e8a04ab225aa2faba0ba1f9e85ab63bf1222e8b8b')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "$srcdir"/*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install fontconfig file (sets Noto Sans Arabic UI as default for ar_AR locale)
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
