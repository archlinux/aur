# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=zeronoise
pkgver=1.04.4
pkgrel=2
pkgdesc='HDR, get tiff from several shots without noise and a lot of dynamic range'
arch=('i686' 'x86_64')
url='http://www.guillermoluijk.com/tutorial/zeronoise/index.htm'
license=('custom:freeware')
depends=(hicolor-icon-theme gsl libpng12 libtiff wxgtk2.8)
options=(!strip emptydirs)
install='zeronoise.install'
source_i686=(https://sites.google.com/site/zeronoiselinux/file-cabinet/$pkgname-${pkgver}_i386.deb)
source_x86_64=(https://sites.google.com/site/zeronoiselinux/file-cabinet/$pkgname-${pkgver}_amd64.deb)
sha256sums_i686=('56a2f42b72c9740f50f3c287c529a30b9369e0ef618de628762831d7280d27f2')
sha256sums_x86_64=('67ca2a816e5c0813acc81582928a1f17f2eb75420842fbc2ee123b1067401c37')
source+=(
zeronoise.desktop
zeronoise_64x64.png
)
sha256sums=('705b41c987289c70744de17c1f926ed3c87caec489cba257fc279fd8e7550a7f'
            '623f959789c96635e9254327950d3a68e681b5d6711cb3f2d9b774c5ecc55196')
package(){
  cd "$srcdir"
  tar zxf data.tar.gz
  install -Dm755 usr/local/bin/zeronoise "$pkgdir"/usr/bin/zeronoise
  install -dm755 "$pkgdir"/usr/share/zeronoise
  install -Dm644 usr/share/zeronoise/default2.png "$pkgdir"/usr/share/zeronoise/
  install -Dm644 usr/share/zeronoise/default.png "$pkgdir"/usr/share/zeronoise/
  install -Dm644 "$srcdir"/zeronoise.desktop "$pkgdir"/usr/share/applications/zeronoise.desktop
  install -Dm644 "$srcdir"/zeronoise_64x64.png "$pkgdir"/usr/share/icons/hicolor/64x64/apps/zeronoise.png
  install -dm755 "$pkgdir"/usr/share/licenses/zeronoise

# workaround to missing libtiff.so.4
  install -dm755 "$pkgdir"/usr/lib
  cd "$pkgdir"/usr/lib
  ln -s libtiff.so libtiff.so.4
}
