# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Maintainer: Daenyth

pkgname=youtube-dl
pkgver=2010.04.04
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com"
arch=('any')
url="http://bitbucket.org/rg3/youtube-dl/"
license=('MIT')
depends=('python')
source=(http://bitbucket.org/rg3/$pkgname/raw/${pkgver}/$pkgname)
md5sums=('89bfe6ecaccedf10ee38ddce04f43152')

build()  {
   install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname

  # install MIT license
    install -d ${pkgdir}/usr/share/licenses/$pkgname
    awk /Copy/,/import/ youtube-dl  | grep -v import \
        | sed -re 's/#?//'  > ${pkgdir}/usr/share/licenses/youtube-dl/COPYING

}

# vim:set ts=2 sw=2 et:
