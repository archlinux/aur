# Maintainer: Zachary Vance <za3k at za3k . com>
 
pkgname=rrthomas-libpaper
_reponame=libpaper
pkgver=2.3
pkgrel=1
arch=('x86_64')
pkgdesc="Replacement for Debian's libpaper"
url="https://github.com/rrthomas/paper"
license=('GPL3')
depends=('glibc')
builddepends=('autoconf' 'perl')
source=("https://github.com/rrthomas/paper/archive/v${pkgver}.tar.gz")
sha256sums=('c04c51cb7fa8361ab3b2b1ea468f984c49d09fbf2033fb2d467e14191928db1c')

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
