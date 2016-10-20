# Contributor: Filip <fila pruda com>
pkgname=ytd
pkgver=1.57
pkgrel=1
pkgdesc="an utility for downloading multimedia content from YouTube and other online streaming services."
arch=('i686' 'x86_64')
url="http://http://www.pepak.net/ytd/ytd/"
license=('GPL')
depends=(wine)
makedepends=()
source=(ytd ytd.desktop http://www.pepak.net/files/youtube/ytd-$pkgver.zip)
md5sums=(
	'fa41961f5092fa471145ade79584fd4b' 'e10bfe126777f969da9eaf35edd0ba65'
	'dd9491e950b24cb3d1a7c7fa1389b1fa')

package() {

  #bin
  install -Dm755 ytd "$pkgdir/usr/bin/ytd"
  
  #app
  install -d -m755 "$pkgdir/usr/share/ytd"
  install -m644 ytd.exe ytd-defs.xml "$pkgdir/usr/share/ytd"
  
  install -d -m755 "$pkgdir/usr/share/ytd/locale"
  cp -r locale/. "$pkgdir/usr/share/ytd/locale"
  
  #desktop icon
  install -Dm644 ytd.desktop "$pkgdir/usr/share/applications/ytd.desktop"
  
  #docs
  install -d -m755 "$pkgdir/usr/share/doc/ytd"
  install -m644 doc/*.txt "$pkgdir/usr/share/doc/ytd"
  
}