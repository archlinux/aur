# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-version
pkgver=0.17.0
pkgrel=1
pkgdesc="A command line function for package version management."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-version.git"
depends=('octetos-coreutils')
md5sums=('19f214299176f060d964adb6b09eeb88')
source=(https://github.com/azaeldevel/octetos-version/archive/0.17.0-alpha.tar.gz)

build() {
    cd octetos-version-0.17.0-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc --with-arch
    make
}

package() {
  cd octetos-version-0.17.0-alpha
  make DESTDIR="${pkgdir}" install
}
