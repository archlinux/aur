# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: raku <raczkow@gmail.com>

pkgname=kim4
pkgver=0.9.8
pkgrel=2
pkgdesc="Kde Image Menu to compress, resize, convert, rename and much more"
arch=('any')
url="http://www.librepc.com/dl/kim/"
license=('GPL')
depends=('bash' 'imagemagick' 'dolphin' 'kdialog')
source=("http://www.librepc.com/dl/kim/kim4-$pkgver.tar.gz")
sha256sums=('dcc1f2fb0a9b69b7b406afab266d0521426dbe3a05a71706aa4dc7e86a70a715')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/src

  install -d ${pkgdir}/usr/share/kservices5/ServiceMenus
  install -Dm644 kim_{compressandresize,convertandrotate,publication}.desktop \
    ${pkgdir}/usr/share/kservices5/ServiceMenus
  install -d ${pkgdir}/usr/bin
  install -Dm755 bin/kim_{album,compress,convert,flipflop,galery,multiburst,other,pelemele} \
    bin/kim_{print,record,rename,resize,resizeandsend,rotate,rotatewithexif} \
    bin/kim_{slideshow,sortbydate,treatment,webexport} ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/kim/slideshow
  install -Dm644 slideshow/{dewslider.swf,index.part1,index.part2} \
    ${pkgdir}/usr/share/kim/slideshow
  install -d ${pkgdir}/usr/share/kim/gallery
  install -Dm644 gallery/{index.part1,index.part2} \
    ${pkgdir}/usr/share/kim/gallery
}
