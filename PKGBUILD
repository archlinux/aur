# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-ar
pkgver=2025.12.01
pkgrel=1
epoch=1
pkgdesc="Google Noto TTF fonts for Arabic Scripts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-emoji: Emoji characters')
_url="https://raw.githubusercontent.com/notofonts/notofonts.github.io/noto-monthly-release-${pkgver}/fonts"
source=("${_url}/NotoKufiArabic/hinted/ttf/NotoKufiArabic-"{Bold,Regular}.ttf
        "${_url}/NotoNaskhArabic/hinted/ttf/NotoNaskhArabic-"{Bold,Regular}.ttf
        "${_url}/NotoNaskhArabicUI/hinted/ttf/NotoNaskhArabicUI-"{Bold,Regular}.ttf
        "${_url}/NotoSansArabic/hinted/ttf/NotoSansArabic-"{Bold,Regular}.ttf
        "${_url}/NotoSansArabicUI/hinted/ttf/NotoSansArabicUI-"{Bold,Regular}.ttf
        "${_url}/LICENSE"
        66-noto-ar.conf)
sha256sums=('1feda69b8b77a5efd9c55f03081f309c8776b08030296638c519d154d9971447'
            '76f539d38a44907365dbccc98466c9c607e74abbfd209add21a254a8ce8668da'
            'f0a1ebcc73185fa0ce65fcc331ee49e7a62cf9105eed22daf4cc7e27fa3dc124'
            'fdfd6d10cbfe5ae14d231fe2fcdff7e6fc041d1df7e38c0cdf0943e55c6a68a8'
            'd2bd1671179c59bb8c3d790eb2c0840e732d37fa1f5577ff34f26b659995dd17'
            'e9f881051a2823b879988727913221bc2d063e9142de8c794387ab46656b6248'
            '4e5462d2e8be880317b9f49b5b2da109ddb6a3563d91cc604b67f3535832a555'
            'bdff3e5659d67e67def05b33f749683b9376ae819d65d3dd62ac4640b3aaef48'
            'ba511a9cf3712cc801203f5fcaf5b35221830f975ec0fc91678e9a4ed07a1f6a'
            'c56275c744ded6ff6df13de04963e6174632f0405a54a83f44d0fe5395f45ae6'
            'f2095b08bed08b23a6fe26112fcd679a2bee3f002eef077eb05d215ed1051bd8'
            '95bff4158481c46fe173003220fa97cd0a6150f6c2abc6dbe5e65882870a47fb')

package() {
  install -Dm644 "$srcdir"/Noto*.ttf -t "$pkgdir"/usr/share/fonts/"$pkgname"
  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install fontconfig preset
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default

  # To enable the included preset (sets Noto Sans Arabic as default for ar_AR locale) run:
  #ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
