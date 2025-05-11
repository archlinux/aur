# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-ar
pkgver=2025.05.01
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
sha256sums=('a11780ed16775fde48967730810431182f8bea2588b81e79b21bb1e5133722e7'
            '02f3f4fe55fe5527ab265fdff00f30f65b020f992c8c3a09a260618c24d2b759'
            '45bb0a9d6803ebc08c2befb7cc61a64a0a8d41d608582d10007e35b13df9031c'
            '2d5d78e9cc27d7193926c7e460314c9da7dbec1268494dbf117adc53c171ac06'
            'd2bd1671179c59bb8c3d790eb2c0840e732d37fa1f5577ff34f26b659995dd17'
            'e9f881051a2823b879988727913221bc2d063e9142de8c794387ab46656b6248'
            'cabdc065d2d3d30562cf1d3e753dc7062bc420beb14942e0c28a211020e2b8d1'
            'c270782ee478c685f95509e724125729e1284c82ebfbe414cc67926f29449e1d'
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
