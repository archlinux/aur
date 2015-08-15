# Contributor: Javier Tia <javier.tia at gmail dot com>
pkgname=dir2ogg
pkgver=0.11.8
pkgrel=4
pkgdesc="dir2ogg converts mp3, m4a, wma, and wav files into ogg-vorbis format."
arch=('any')
url="http://jak-linux.org/projects/dir2ogg"
license=('GPL2')
depends=('python2' 'mutagen' 'vorbis-tools')
source=("http://jak-linux.org/projects/dir2ogg/0.11/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0b6fd089fc1eb20cc92b7901c947ff6033ce04c897f9af9f962fa421a67ba7e0')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1

  sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' ${pkgname}-${pkgver}/dir2ogg
  cp ${pkgname}-${pkgver}/dir2ogg   ${pkgdir}/usr/bin
  cp ${pkgname}-${pkgver}/dir2ogg.1 ${pkgdir}/usr/share/man/man1
}

# vim:set ft=sh ts=2 sw=2 et:
