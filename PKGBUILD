# Maintainer: Sébastien Luttringer

pkgname=mailboot
pkgver=3
pkgrel=1
pkgdesc='Send an email when your computer boot'
arch=('any')
url='https://github.com/seblu/mailboot'
license=('GPL')
depends=('bash' 'systemd' 'sed')
backup=('etc/mailboot.conf')
source=("http://ftp.seblu.net/softs/mailboot/$pkgname-$pkgver.tar.xz")
md5sums=('4e17ee95cfc560b16dd0dfff1fa89b61')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
  # license is well gpl, remove it
  rm "$pkgdir/usr/share/doc/mailboot/LICENSE"
}

# vim:set ts=2 sw=2 et:
