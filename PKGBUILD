# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-ar
epoch=1
pkgver=23.12.1
pkgrel=3
pkgdesc="Google Noto TTF fonts for Arabic Scripts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-emoji: Emoji characters')
_url="https://github.com/notofonts/notofonts.github.io/raw/noto-monthly-release-${pkgver}/fonts"
source=("${_url}/NotoKufiArabic/hinted/ttf/NotoKufiArabic-"{Bold,Regular}.ttf
        "${_url}/NotoNaskhArabic/hinted/ttf/NotoNaskhArabic-"{Bold,Regular}.ttf
        #"${_url}/NotoNaskhArabicUI/hinted/ttf/NotoNaskhArabicUI-"{Bold,Regular}.ttf
        "${_url}/NotoSansArabic/hinted/ttf/NotoSansArabic-"{Bold,Regular}.ttf
        #"${_url}/NotoSansArabicUI/hinted/ttf/NotoSansArabicUI-"{Bold,Regular}.ttf
        "${_url}/LICENSE"
        66-noto-ar.conf)
sha256sums=('74122098a0aca46452605e62fe60d56537906fbe7c5af3fc42b982b5c91a906e'
            '36b64d6449df10d9d7b4327d570f790bdf676be08601574eb127f0bf0d71d0f9'
            '6a6abacebd8f08cf24cda234770d9eabfd35fe7bb76c5dd66ae99e86f630bf92'
            'a9662e3ee87c3f9640ad25ba33078298cddab197a3e8da75a3b1feea42b85ef3'
            'cabdc065d2d3d30562cf1d3e753dc7062bc420beb14942e0c28a211020e2b8d1'
            'c270782ee478c685f95509e724125729e1284c82ebfbe414cc67926f29449e1d'
            'f2095b08bed08b23a6fe26112fcd679a2bee3f002eef077eb05d215ed1051bd8'
            'd9543a6e1c0edd091c010ee84591ee556e57c2a1ad536a669c3f91c8ee53fd98')

package() {
  install -Dm644 "$srcdir"/Noto*.ttf -t "$pkgdir"/usr/share/fonts/"$pkgname"
  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install fontconfig preset
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
	# The following command can be used to sets Noto Sans Arabic as default for ar_AR locale
  #ln -rs /usr/share/fontconfig/conf.avail/66-noto-ar.conf /etc/fonts/conf.d
}
