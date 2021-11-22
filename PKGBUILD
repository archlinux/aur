# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=ytdownloader
wsp=YtDownloader
pkgver=1.4.0
pkgrel=2
pkgdesc="GKT3 frontend for yt-dlp (the active branch of youtube-dl) with focus on best audio and video. Uses ffmpeg for joining audio & video"
url="https://github.com/kanehekili/YoutubeDownloader"
license=('GPL2' 'MIT')
depends=('python' 'python-gobject' 'ffmpeg')
arch=('x86_64')
source=(https://github.com/kanehekili/YoutubeDownloader/releases/download/1.4.0/YtDownloader1.4.0.tar)
md5sums=(4ce7ae6922decc9401506de8f34c86ed)

package(){	
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/bin"
  rm $srcdir/$wsp/install.sh
  rm $srcdir/$wsp/uninstall.sh
  cp $srcdir/$wsp/YtGui.desktop $pkgdir/usr/share/applications
  cp -r $srcdir/$wsp/* $pkgdir/opt/$pkgname
  if !  test -f "/usr/local/bin/yt-dlp"; then
  	cp $srcdir/$wsp/yt-dlp $pkgdir/usr/local/bin/
  fi
  chmod +x ${pkgdir}/opt/${pkgname}/YtGui.py
  chmod a+rx /usr/local/bin/yt-dlp
  ln -s ${pkgdir}/opt/${pkgname}/YtGui.py  ${pkgdir}/usr/bin/YtGui
}


