# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=videomerge
pkgver=2.1.0
pkgrel=1
pkgdesc="Simple and fast mp4/matroska/Av1/webm/mp2/mpts Video merger"
url="https://github.com/kanehekili/VideoMerge"
license=('GPL2')
depends=('python-pyqt6' 'ffmpeg')
arch=('any')
source=(https://github.com/kanehekili/VideoMerge/releases/download/2.1.0/videomerge2.1.0.tar)
md5sums=(22a852fec0fe55dc6787a1494b304380)


package(){	
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/bin"
  rm $srcdir/$pkgname/install.sh
  rm $srcdir/$pkgname/uninstall.sh
  cp $srcdir/$pkgname/VideoMerge.desktop $pkgdir/usr/share/applications
  cp -r $srcdir/$pkgname/* $pkgdir/opt/$pkgname
  chmod +x ${pkgdir}/opt/${pkgname}/VideoMerge.py
  ln -s /opt/${pkgname}/VideoMerge.py  ${pkgdir}/usr/bin/videomerge
}


