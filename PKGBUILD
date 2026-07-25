# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=ytdownloader
pkgver=1.6.2
pkgrel=1
pkgdesc="GKT3 frontend for yt-dlp (the active branch of youtube-dl) with focus on best audio and video. Uses ffmpeg for joining audio & video"
url="https://github.com/kanehekili/YoutubeDownloader"
license=('GPL2' 'MIT')
depends=('python' 'python-gobject' 'ffmpeg' 'yt-dlp' 'deno')
arch=('any')
source=(https://github.com/kanehekili/YoutubeDownloader/releases/download/1.6.2/ytdownloader1.6.2.tar)
md5sums=(5ac8c81c1acc6c5bca45f38367f208c2)

package(){	
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/bin"
  rm $srcdir/$pkgname/install.sh
  rm $srcdir/$pkgname/uninstall.sh
  cp $srcdir/$pkgname/YtGui.desktop $pkgdir/usr/share/applications
  cp -r $srcdir/$pkgname/* $pkgdir/opt/$pkgname
  chmod +x ${pkgdir}/opt/${pkgname}/YtGui.py
  chmod a+rx ${pkgdir}/opt/${pkgname}/yt-dlp  
  ln -sf /opt/${pkgname}/YtGui.py  ${pkgdir}/usr/bin/ytgui
}



