# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-coreutils
pkgver=0.17.0
pkgrel=1
pkgdesc="Similar to coretils but is a C ++ API."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-coreutils.git"
depends=('octetos-core' 'check')
#backup=('etc/nanorc')
md5sums=('019b4f3d54b3c83c08d17d4cb8aba3f2')
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
