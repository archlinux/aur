# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-coreutils
pkgver=0.11.1
pkgrel=1
pkgdesc="Similar to coretils but is a C ++ API."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-coreutils.git"
depends=('octetos-core')
#backup=('etc/nanorc')
md5sums=('b19aa1b002deceee3872f4dc6bc7de9e')
source=(https://github.com/azaeldevel/${pkgname}/archive/${pkgver}-alpha.tar.gz)

build() {
    cd ${pkgname}-${pkgver}-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd ${pkgname}-${pkgver}-alpha
  make DESTDIR="${pkgdir}" install
}
