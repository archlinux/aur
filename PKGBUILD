# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmapp
pkgver=0.0.4.3
pkgrel=1
pkgdesc="DockApp Graphics Library"
arch=('i686' 'x86_64')
url="http://www.starplot.org/wmapp/"
license=("GPL")
depends=('libxpm')
options=('staticlibs')
source=("http://www.starplot.org/wmapp/downloads/${pkgname}-${pkgver}.tar.gz"
        const.patch)
md5sums=('38a0e1ebe586a0d89aeb6e0b05be66f9')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np2 -b -z .orig -i ../const.patch
}
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
  make wmexample
  make wmatc
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 wmexample "${pkgdir}/usr/bin/wmexample"
  install -Dm0755 wmatc "${pkgdir}/usr/bin/wmatc"
  install -Dm0644 libwmapp.a "${pkgdir}/usr/lib/libwmapp.a"
  install -d "${pkgdir}/usr/include/wmapp"
  install -m0644 *.h "${pkgdir}/usr/include/wmapp"
}

# vim: sw=2
md5sums=('38a0e1ebe586a0d89aeb6e0b05be66f9'
         '1007ce63b6c59bcf9f7229fc94060cfe')
md5sums=('38a0e1ebe586a0d89aeb6e0b05be66f9'
         'f51006971d888f5721809a86162d2691')
