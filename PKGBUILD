# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-version
pkgver=0.14.2
pkgrel=1
pkgdesc="A command line function for package version management."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-version.git"
depends=('octetos-coreutils')
md5sums=('90076e135e36f207e63c0f3d0c05d432')
source=(https://github.com/azaeldevel/octetos-version/archive/0.14.2-alpha.tar.gz)

build() {
    cd octetos-version-0.14.2-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc --with-pacman
    make
}

package() {
  cd octetos-version-0.14.2-alpha
  make DESTDIR="${pkgdir}" install
}
