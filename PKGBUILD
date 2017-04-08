# Maintainer: Jon Arnold <jonarnoldsemail at gmail dot com>
# Contributor: Xiao-Long Chen
pkgname=pacpl
pkgver=5.1.0
pkgrel=1
pkgdesc="Convert multiple audio types from one format to another."
arch=('any')
url="http://pacpl.sourceforge.net/"
license=('GPL')
depends=(
  'perl'
  'perl-parse-recdescent'
  'perl-inline'
  'libogg'
  'flac'
  'perl-ogg-vorbis-header'
  'perl-mp3-info'
  'perl-mp4-info'
  'perl-mp3-tag'
  'perl-audio-flac-header'
  'perl-audio-musepack'
  'cddb_get'
  'vorbis-tools'
  'perl-switch'
  'perl-parallel-forkmanager'
  'perl-cddb'
)
install=${pkgname}.install
source=(git://git.code.sf.net/p/pacpl/code)
makedeps=(
  'autoconf'
)
md5sums=('SKIP')


build() {
  cd "${srcdir}/code"
  autoconf
  ./configure
  make
}

package() {
  cd "${srcdir}/code"
  make DESTDIR="${pkgdir}" install
  rm -rvf ${pkgdir}/usr/share/apps
}
# vim:syntax=sh
