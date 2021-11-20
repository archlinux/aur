# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=ytdownloader
wsp=YtDownloader
pkgver=1.3.3
pkgrel=1
pkgdesc="GKT3 frontend for youtube-dl with focus on best audio and video. Uses ffmpeg for joining audio & video"
url="https://github.com/kanehekili/YoutubeDownloader"
license=('GPL2' 'MIT')
depends=('ffmpeg' 'youtube-dl')
arch=('x86_64')
source=(https://github.com/kanehekili/YoutubeDownloader/releases/download/1.3.3/YtDownloader1.3.3.tar)
md5sums=(d98c7c16fbb4686adb12ee0a41d319bf)

package(){	
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/bin"
  rm  $srcdir/$wsp/install.sh
  rm  $srcdir/$wsp/uninstall.sh
  rm  $srcdir/$wsp/installYoutube-dl.sh
  cp  $srcdir/$wsp/YtGui.desktop $pkgdir/usr/share/applications
  cp -r $srcdir/$wsp/* $pkgdir/opt/$pkgname
  chmod +x ${pkgdir}/opt/${pkgname}/YtGui.py
  ln -s ${pkgdir}/opt/${pkgname}/YtGui.py  ${pkgdir}/usr/bin/YtGui
}


