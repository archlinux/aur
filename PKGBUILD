# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: raku <raczkow@gmail.com>

pkgname=kim4
pkgver=0.9.5
pkgrel=7
pkgdesc="Kde Image Menu to compress, resize, convert, rename and much more"
arch=('any')
url="https://www.kde-apps.org/content/show.php?content=11505"
license=('GPL')
depends=('bash' 'imagemagick' 'dolphin' 'kdialog')
source=(http://bouveyron.free.fr/kim/release/$pkgname-$pkgver.tar.gz)
md5sums=('c7934ab0dbf988da5f60d9c4cbf97dd5')

package() {
  cd ${srcdir}/${pkgname}/src

  install -d ${pkgdir}/usr/share/kservices5/ServiceMenus
  install -Dm644 kim_{compressandresize,convertandrotate,publication}.desktop \
    ${pkgdir}/usr/share/kservices5/ServiceMenus
  install -d ${pkgdir}/usr/bin
  install -Dm755 bin/kim_{album,compress,convert,flipflop,galery,multiburst,other,pelemele} \
    bin/kim_{print,record,record_mpg,rename,resize,resizeandsend,rotate,rotatewithexif} \
    bin/kim_{slideshow,sortbydate,treatment,webexport} ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/kim/slideshow
  install -Dm644 slideshow/{dewslider.swf,index.part1,index.part2} \
    ${pkgdir}/usr/share/kim/slideshow
  install -d ${pkgdir}/usr/share/kim/gallery
  install -Dm644 gallery/{index.part1,index.part2} \
    ${pkgdir}/usr/share/kim/gallery
}
