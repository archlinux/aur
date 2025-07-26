# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=ytdownloader
pkgver=1.5.0
pkgrel=1
pkgdesc="GKT3 frontend for yt-dlp (the active branch of youtube-dl) with focus on best audio and video. Uses ffmpeg for joining audio & video"
url="https://github.com/kanehekili/YoutubeDownloader"
license=('GPL2' 'MIT')
depends=('python' 'python-gobject' 'ffmpeg' 'yt-dlp')
arch=('any')
source=(https://github.com/kanehekili/YoutubeDownloader/releases/download/1.5.0/ytdownloader1.5.0.tar)
md5sums=(baf1e30d4d819238f2d5ad2190138bbf)

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



