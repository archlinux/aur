# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-ar
pkgver=24.5.1
pkgrel=1
epoch=1
pkgdesc="Google Noto TTF fonts for Arabic Scripts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-emoji: Emoji characters')
_url="https://github.com/notofonts/notofonts.github.io/raw/noto-monthly-release-${pkgver}/fonts"
source=("${_url}/NotoKufiArabic/hinted/ttf/NotoKufiArabic-"{Bold,Regular}.ttf
        "${_url}/NotoNaskhArabic/hinted/ttf/NotoNaskhArabic-"{Bold,Regular}.ttf
        "${_url}/NotoSansArabic/hinted/ttf/NotoSansArabic-"{Bold,Regular}.ttf
        "${_url}/LICENSE"
        66-noto-ar.conf)
sha256sums=('a11780ed16775fde48967730810431182f8bea2588b81e79b21bb1e5133722e7'
            '02f3f4fe55fe5527ab265fdff00f30f65b020f992c8c3a09a260618c24d2b759'
            '6a6abacebd8f08cf24cda234770d9eabfd35fe7bb76c5dd66ae99e86f630bf92'
            'a9662e3ee87c3f9640ad25ba33078298cddab197a3e8da75a3b1feea42b85ef3'
            'cabdc065d2d3d30562cf1d3e753dc7062bc420beb14942e0c28a211020e2b8d1'
            'c270782ee478c685f95509e724125729e1284c82ebfbe414cc67926f29449e1d'
            'f2095b08bed08b23a6fe26112fcd679a2bee3f002eef077eb05d215ed1051bd8'
            'f69d3162da2d927bd158501531e04775d890361bc79d1d4ab77c3ad34e866650')

package() {
  install -Dm644 "$srcdir"/Noto*.ttf -t "$pkgdir"/usr/share/fonts/"$pkgname"
  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install fontconfig preset
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail

  # To enable the included preset (sets Noto Sans Arabic as default for ar_AR locale) run:
  #ln -s /usr/share/fontconfig/conf.avail/66-noto-ar.conf /etc/fonts/conf.d
}
