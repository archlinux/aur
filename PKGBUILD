# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=rpgvxace-rtp
pkgver=100
pkgrel=1
pkgdesc="RPGMaker VX Ace Runtime Package"
url='http://www.rpgmakerweb.com/download/additional/run-time-packages'
arch=('any')
license=('custom: commercial')
makedepends=('libarchive' 'innoextract' 'convmv')
source=("http://tkool.jp/assets/files/vxace_rtp$pkgver.zip" "LICENSE")
md5sums=('40fb975ab967ef519e28ade703ddd848' '01fee4ed0a5af011bd5b16e54f80e511')
noextract=vxace_rtp$pkgver.zip

package() {
  cd "$srcdir"
  bsdtar xf vxace_rtp$pkgver.zip
  cd RPGVXAce_RTP$pkgver
  innoextract Setup.exe
  convmv -r -f SHIFT-JIS -t utf-8 --notest .
  mkdir -p "$pkgdir/opt/"
  cp -r app "$pkgdir/opt/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/$pkgname/LICENSE"
}
