pkgname=otf-noto-sans-cjk
pkgver=2.004
pkgrel=1
pkgdesc='Noto CJK fonts (Sans, Variable OTC)'
provides=(noto-fonts-cjk)
arch=(any)
url='https://www.google.com/get/noto/help/cjk'
license=(custom:SIL)
source=(https://github.com/notofonts/noto-cjk/releases/download/Sans${pkgver}/03_NotoSansCJK-OTC.zip
        70-noto-sans-cjk.conf)
sha256sums=('528f4e1b25ff3badb0321b38d015d954c4c0de926c7830ef50e4a1948f6a3eed'
            '83a923a9ad5ea558aac3087879ecae7822e437f7dd745a4d8c6385e061863779')

package_otf-noto-sans-cjk() {
  install -Dm644 NotoSansCJK-*.ttc -t "$pkgdir"/usr/share/fonts/noto-cjk
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 70-noto-sans-cjk.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
