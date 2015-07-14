# Maintainer: osa_k <osak.63@gmail.com>
# Contributor: Brian F. G. Bidulock <bidulock@openss7.org>

pkgname=wmcpu
pkgver=1.4
pkgrel=3
pkgdesc="Dockapp CPU monitor resembling Xosview."
arch=('i686' 'x86_64')
url="http://www.ne.jp/asahi/linux/timecop/#wmcpu"
license=("GPL")
depends=('x-server')
makedepends=('make')
#source=(http://dockapps.windowmaker.org/download.php/id/673/wmcpu-1.4.tar.gz
#        makefile.patch)
source=(wmcpu-1.4.tar.gz
        makefile.patch)
md5sums=('e690eda219cdf285476bcbb602a117ff'
		 '5e80a4fc615e6ffbce9ae36df698b88d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/makefile.patch"
  make || return 1
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 -d "${pkgdir}/usr/bin"
  make DESTDIR=${pkgdir} install
}

