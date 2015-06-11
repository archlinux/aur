# Maintainer: Christos Nouskas <nous at archlinux dot us>

pkgname=x264transcode
pkgver=0.3.1
pkgrel=1
pkgdesc="Script for automated backup of DVDs, SD VOB and HD M2TS files. Rips ALL subtitles, ALL audio tracks and chapter info into a MKV container. Video stream is cropped to get rid of black borders."
arch=(any)
url="http://www2.warwick.ac.uk/fac/sci/csc/people/computingstaff/jaroslaw_zachwieja/x264transcode"
license=('GPL3')
depends=('ogmtools' 'lsdvd' 'mkvtoolnix' 'dbus-python' 'pygobject')
optdepends=('crswallow')
source=(https://github.com/downloads/jzachwieja/$pkgname/$pkgname-$pkgver.tar.gz)
install=$pkgname.install

package() {
  cd $srcdir/$pkgname
  sed -i s/python/python2/ autorip.py
  install -d -m755 $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/share/$pkgname
  install -D -m755 ./*.sh ./*.py $pkgdir/usr/bin/
  install -D -m644 CHANGELOG COPYING README autoripper.conf $pkgdir/usr/share/$pkgname
}

#
sha256sums=('301ce6b198c1580b777712711d3b59af08f5932dc263e3a01c51e886d85a8dce')
