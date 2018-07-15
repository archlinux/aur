# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Mathieu Pasquet <mathieui@mathieui.net>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>

pkgname=makedumpfile
pkgver=1.6.4
pkgrel=1
pkgdesc="A tool to generate smaller dumpfiles from kdump memory dumps"
license=('GPL2')
depends=('perl' 'elfutils')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/makedumpfile"
source=("https://netcologne.dl.sourceforge.net/project/makedumpfile/makedumpfile/${pkgver}/makedumpfile-${pkgver}.tar.gz")
sha256sums=('7e06f72d5f291fcab9e92975f405a76e37d4f7fc8fa4172f199636398ae812b1')

build() {
  cd $srcdir/$pkgname-$pkgver
  make LINKTYPE=dynamic
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install DESTDIR="${pkgdir}"

  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

