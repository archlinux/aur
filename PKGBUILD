# Contributor: Javier Tiá <javier.tia at gmail dot com>

pkgname=dir2ogg
pkgver=0.12
pkgrel=2
pkgdesc="dir2ogg converts mp3, m4a, wma, and wav files into ogg-vorbis format"
arch=('any')
url="http://jak-linux.org/projects/dir2ogg"
license=('GPL2')
depends=('python2' 'mutagen' 'vorbis-tools')
source=("${url}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2876db3926415f40d728122f5836532253a25db1bc4877505e77ebcbc0cb5fea')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 < ../../os_rename__to__shutil_move.patch
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/man/man1

  sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' ${pkgname}-${pkgver}/dir2ogg
  cp ${pkgname}-${pkgver}/dir2ogg   ${pkgdir}/usr/bin
  cp ${pkgname}-${pkgver}/dir2ogg.1 ${pkgdir}/usr/share/man/man1
}

# vim:set ft=sh ts=2 sw=2 et:
