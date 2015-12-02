# Maintainer: THEGUSPROJECT <gus@thegusproject.xyz>

pkgname=tunesviewer
pkgver=1.5.3
pkgrel=1
pkgdesc="TunesViewer is a small, easy to use program to access iTunes-university media and podcasts in Linux."
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/tunesviewer/"
options=('!strip')
sha1sums=SKIP

source=("http://tcpdiag.dl.sourceforge.net/project/tunesviewer/${pkgname}_${pkgver}.deb")

depends=("python2" "pygtk" "python2-lxml" "python2-notify" "python2-support" "pywebkitgtk")
optdepends=("soundconverter" "vlc")

package() {
  tar xvfJ data.tar.xz
  mkdir -p $pkgdir/usr
  cd $srcdir
  cp -r usr $pkgdir
  chmod -R 755 $pkgdir/usr/bin/tunesviewer
  chmod -R 755 $pkgdir/usr/share/applications/TunesViewer.desktop
  chmod -R 755 $pkgdir/usr/share/tunesviewer
}