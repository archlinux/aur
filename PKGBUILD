# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Mathieu Pasquet <mathieui@mathieui.net>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>

pkgname=makedumpfile
pkgver=1.6.0
pkgrel=1
pkgdesc="A tool to generate smaller dumpfiles from kdump memory dumps"
license=('GPL2')
depends=('perl' 'elfutils')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/makedumpfile"
source=("http://downloads.sourceforge.net/project/makedumpfile/makedumpfile/${pkgver}/makedumpfile-${pkgver}.tar.gz")
sha256sums=('e3147abc52df2ceac1e9affef45bf37e2f2e1d9979bc94a761ee11e4044072ac')

build() {
  cd $srcdir/$pkgname-$pkgver
  make LINKTYPE=dynamic
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install DESTDIR="${pkgdir}"

  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

