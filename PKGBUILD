# Maintainer: Azael Reyes <azael.devel@gmail.com>

pkgname=octetos-schedule
pkgver=0.46.7
pkgrel=1
phase=alpha
pkgdesc="Orgonizador de Horarios Escolares"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/$pkgname.git"
depends=('octetos-core' 'octetos-EC' 'libzip' 'gtkmm3')
#backup=('etc/nanorc')
md5sums=('0274f9317a7a251ee9dd8fa59162e682')
source=(https://github.com/azaeldevel/$pkgname/archive/$pkgver-$phase.tar.gz)

build() {
    cd $pkgname-$pkgver-$phase
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd $pkgname-$pkgver-$phase
  make DESTDIR="${pkgdir}" install
}
