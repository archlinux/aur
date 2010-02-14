# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Maintainer: Daenyth

pkgname=youtube-dl
pkgver=2010.02.13
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com"
arch=('any')
url="http://bitbucket.org/rg3/youtube-dl/"
license=('MIT')
depends=('python')
source=(http://bitbucket.org/rg3/$pkgname/raw/${pkgver}/$pkgname)
md5sums=('276e8142b4c271b249cbd11fdabd4677')

build()  {
   install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname

  # install MIT license
    install -d ${pkgdir}/usr/share/licenses/$pkgname
    awk /Copy/,/import/ youtube-dl  | grep -v import \
        | sed -re 's/#?//'  > ${pkgdir}/usr/share/licenses/youtube-dl/COPYING

}
