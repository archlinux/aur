# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>

pkgname=katarina
pkgver=2.0
pkgrel=1
pkgdesc="a perl backup system using rsync as transport"
arch=('any')
url="http://katarina.sourceforge.net/"
license=('GPL2')
depends=('perl' 'rsync')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('0fc4aad047c42342ed7d5d656d9bc2fe')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  sed -e 's|/usr/local/bin/katarina-status|/usr/bin/katarina-status|g' -i *
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -Dm0755 katarina.pl "$pkgdir"/usr/bin/katarina
  install -Dm0755 katarina-scheduler.pl "$pkgdir"/usr/bin/katarina-scheduler
  install -Dm0755 katarina-status.pl "$pkgdir"/usr/bin/katarina-status

  install -Dm0755 munin-katarina "$pkgdir"/usr/bin/munin-katarina
  install -Dm0755 munin-katarina-sim "$pkgdir"/usr/bin/munin-katarina-sim
}

# vim:set ts=2 sw=2 et:
