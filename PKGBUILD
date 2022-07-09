# Maintainer: Andreas Hemmerle <andreas dot hemmerle at gmail dot com>
pkgname=vdr-transcode
pkgver=1.0.12
pkgrel=1
pkgdesc='Swiss knife for VDR transcoding.'
_commit='cc3d802752081d534124b87aa297f29c2b9ebe73'
arch=(any)
license=('none')
url='https://github.com/jsffm/vdr-transcode'
depends=("ffmpeg")
source=("vdr-transcode::git+https://github.com/jsffm/vdr-transcode#commit=${_commit}")
md5sums=('SKIP')


#pkgver() {
#  cd "$srcdir/${pkgname}"
#  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
#}


package () {
  cd "$srcdir/${pkgname}"
  instp=$pkgdir/usr/local/bin

  install -D -m 755 vdr-transcode $instp/vdr-transcode
  install -D -m 644 vdr-transcode.conf $pkgdir/etc/vdr-transcode.conf

  cd $instp
  ln -s vdr-transcode vt
}
