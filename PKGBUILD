# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Mathieu Pasquet <mathieui@mathieui.net>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>

pkgname=makedumpfile
pkgver=1.5.8
pkgrel=1
pkgdesc="A tool to generate smaller dumpfiles from kdump memory dumps"
license=('GPL2')
depends=('perl' 'elfutils')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/makedumpfile"
source=("http://freefr.dl.sourceforge.net/project/makedumpfile/makedumpfile/${pkgver}/makedumpfile-${pkgver}.tar.gz")
sha256sums=('dd9c6c40c1ae6774b61bbe7b53f5ebbee9734f576d8ecb75ffb929288f5ea64d')

build() {
  cd $srcdir/$pkgname-$pkgver
  make LINKTYPE=dynamic
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install DESTDIR="${pkgdir}"

  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

