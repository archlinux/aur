# Contributor: monty <linksoft [at] gmx [dot] de>

pkgname=navicat-lite
pkgver=10.0.6
_pkgver=${pkgver%.*}
pkgrel=2
pkgdesc="A fast, reliable and affordable Database Administration tool purpose-built for simplifying database management and reducing administration costs."
url="http://www.navicat.com"
license=('custom')
arch=('any')
source=(http://dl.dropbox.com/u/152616/navicat100_lite_en.tar.gz
        navicat.desktop
        navicat)
md5sums=('f44cb252012eadd5d4935414de68d087'
         '0a40410d7be7d9e324002c368eafd0b3'
         'a7f10a4d9c2c3901829c35c5bf9aae97')

package() {
  mkdir -p ${pkgdir}/opt/navicat
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications
  cp -R ${srcdir}/navicat${_pkgver/./}_lite_en/* ${pkgdir}/opt/navicat/
  cp ${srcdir}/navicat ${pkgdir}/usr/bin/
  chmod +x ${pkgdir}/usr/bin/navicat
  cp ${srcdir}/navicat.desktop ${pkgdir}/usr/share/applications/
}
