# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-version
pkgver=0.13.1
pkgrel=1
pkgdesc="A command line function for package version management."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-version.git"
depends=('octetos-coreutils')
md5sums=('36272c4104dcfaf16fd1dd0da9bac502')
source=(https://github.com/azaeldevel/octetos-version/archive/0.13.1-alpha.tar.gz)

build() {
    cd octetos-version-0.13.1-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc --with-pacman
    make
}

package() {
  cd octetos-version-0.13.1-alpha
  make DESTDIR="${pkgdir}" install
}
