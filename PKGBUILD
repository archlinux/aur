# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Testuser_01 <arch@nico-siebler.de>
# Contributor: Testuser_01 <arch@nico-siebler.de>
# Contributor: David H. Bronke <whitelynx at gmail.com>
pkgname='fastoggenc'
pkgver=0.1.4
pkgrel=3
pkgdesc="A parallelized Python script which converts MP3, M4A, WMA, WAV into OGG Vorbis"
arch=('any')
url="http://sourceforge.net/projects/fastoggenc/"
depends=(mplayer mpg123 lame flac faad2 vorbis-tools wavpack musepack-tools cdparanoia cdrkit mutagen)
license=('GPLv3')
source=("http://downloads.sourceforge.net/project/fastoggenc/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
  mkdir -p "${pkgdir}/usr/bin/" || return 1
  sed -e 's@#!/usr/bin/python@#!/usr/bin/python2@' -i "${pkgname}/${pkgname}" || return 1
  install -m755 -D "${pkgname}/${pkgname}" "${pkgdir}/usr/bin/" || return 1
}

md5sums=('db8576f9d49741680c06a23940a38885')
sha1sums=('91f78e026762a08ccf468de5c2e89bed717d5f96')
sha256sums=('d781b558c7848f27a61362fd7abcd4065e1feb711916292d0e8e828e2a6e2a12')
