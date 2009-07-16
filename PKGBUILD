# $Id: PKGBUILD,v 1.22 2009/07/13 19:16:06 rvanharen Exp $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=youtube-dl
pkgver=2009.06.29
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com"
arch=('i686' 'x86_64')
url="http://bitbucket.org/rg3/youtube-dl/"
license=('MIT')
depends=('python')
source=(http://bitbucket.org/rg3/youtube-dl/raw/${pkgver}/youtube-dl)
md5sums=('1650621de4e8f840177d5ce41fc39192')

build()  {
   install -Dm755 $srcdir/youtube-dl $pkgdir/usr/bin/youtube-dl

  # install MIT license
    install -d ${pkgdir}/usr/share/licenses/youtube-dl
    awk /Copy/,/import/ youtube-dl  | grep -v import \
        | sed -re 's/#?//'  > ${pkgdir}/usr/share/licenses/youtube-dl/COPYING

}
