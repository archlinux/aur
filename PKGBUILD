# Maintainer: Zachary Vance <za3k at za3k . com>
 
pkgname=rrthomas-libpaper
_reponame=paper
pkgver=2.0
pkgrel=1
arch=('x86_64')
pkgdesc="Replacement for Debian's libpaper"
url="https://github.com/rrthomas/paper"
license=('GPL3')
depends=('glibc')
builddepends=('autoconf' 'perl')
source=("https://github.com/rrthomas/paper/archive/v${pkgver}.tar.gz")
sha256sums=('61a40576d0391e17dac1fbba0253967ace0ccec80bb18aa29d4ada41534fb16c')

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
