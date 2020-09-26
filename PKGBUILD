# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-version
pkgver=0.19.0
pkgrel=1
pkgdesc="A command line function for package version management."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-version.git"
depends=('octetos-coreutils')
md5sums=('24e61fa85905dba46fcb9fe6be40212d')
source=(https://github.com/azaeldevel/octetos-version/archive/0.19.0-alpha.tar.gz)

build() {
    cd octetos-version-0.19.0-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc --with-pacman
    make
}

package() {
  cd octetos-version-0.19.0-alpha
  make DESTDIR="${pkgdir}" install
}
