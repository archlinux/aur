# Maintainer: Jonathan Hudson <jh+gtk-g-rays@daria.co.uk>
# Contributor: Lukas Kramer <lukas@carrotIndustries.net>
pkgname=gtk-g-rays2
pkgver=2.05
pkgrel=1
pkgdesc="Access the configuration data (and visualise NMEA data) from the WBT-201 GPS"
arch=(i686 x86_64 armv6l armv6h armv7h ppc)
url="http://www.daria.co.uk/gps"
license=('GPL')
depends=('gtk3' 'hicolor-icon-theme')
source=(http://www.zen35309.zen.co.uk/gps/gtk-g-rays2-$pkgver.tar.xz)
# shutup namcap
install='g-rays.install'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha512sums=('673d6e756f1a827e1c0de5384f3228e69a00a56588b81528202e80f5d2067213fd9fdb5af22028fcce0c4ea9e4d1b708accdd5777628ded351e3f2b6f2f57e41')

