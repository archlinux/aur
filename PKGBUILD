# Maintainer: ploxiln <pierce.lopez@gmail.com>

pkgname=mbrowse
pkgver=0.4.3
pkgrel=3
pkgdesc='A graphical SNMP MIB browser based on GTK+ and Net-SNMP'
arch=('i686' 'x86_64')
license=('GPL')
url='https://sourceforge.net/projects/mbrowse/'
depends=('gtk2' 'net-snmp')
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('735a86a027659d3be39723d554758d6b51cce56ef3807efd5123d48ebf41506e')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
