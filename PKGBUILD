pkgname=otf-noto-serif-cjk
pkgver=2.002
pkgrel=1
pkgdesc='Noto CJK fonts (Serif, Static OTC)'
provides=(noto-fonts-cjk)
arch=(any)
url='https://www.google.com/get/noto/help/cjk'
license=(custom:SIL)
source=(https://github.com/notofonts/noto-cjk/releases/download/Serif${pkgver}/04_NotoSerifCJKOTC.zip
        70-noto-serif-cjk.conf)
sha256sums=('941985d9fd860492d15640b53edc9668d568877140c524ccd83deb3d9b7a2950'
            'ad900dbcbf6f6427d86adfb78d5d395d97a2bb5182468ae6a09bbb13a74c0765')

package_otf-noto-serif-cjk() {
  install -Dm644 OTC/NotoSerifCJK-*.ttc -t "$pkgdir"/usr/share/fonts/noto-cjk
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 70-noto-serif-cjk.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
