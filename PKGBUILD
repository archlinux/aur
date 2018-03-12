# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Mathieu Pasquet <mathieui@mathieui.net>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>

pkgname=makedumpfile
pkgver=1.6.3
pkgrel=1
pkgdesc="A tool to generate smaller dumpfiles from kdump memory dumps"
license=('GPL2')
depends=('perl' 'elfutils')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/makedumpfile"
source=("http://downloads.sourceforge.net/project/makedumpfile/makedumpfile/${pkgver}/makedumpfile-${pkgver}.tar.gz")
sha256sums=('cb1afe2cf24147eac983694bfbcf8c1b149eeeb92289562d4d25fbe3b100b125')

build() {
  cd $srcdir/$pkgname-$pkgver
  make LINKTYPE=dynamic
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install DESTDIR="${pkgdir}"

  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

