# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=rpgvx-rtp
pkgver=202
pkgrel=1
pkgdesc="RPGMaker VX Runtime Package"
url='http://www.rpgmakerweb.com/download/additional/run-time-packages'
arch=('any')
license=('custom: commercial')
makedepends=('libarchive' 'innoextract' 'convmv')
source=("http://tkool.jp/assets/files/vx_rtp$pkgver.zip" "LICENSE")
md5sums=('9d5377c02400491f96adcf9f429b9b8e' '27ea6c531f6cb54d86c701f1595c63a5')
noextract=vx_rtp202.zip

package() {
  cd "$srcdir"
  bsdtar xf vx_rtp$pkgver.zip
  cd RPGVX_RTP$pkgver
  convmv -r -f SHIFT-JIS -t utf-8 --notest .
  innoextract setup.exe
  mkdir -p "$pkgdir/opt/"
  cp -r app "$pkgdir/opt/$pkgname"
  cp "利用規約.txt" "$pkgdir/opt/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/$pkgname/LICENSE"
}
