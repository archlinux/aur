# Maintainer: ninian <mcfadzean.org.uk ta linux>

pkgname=supermenu
pkgver=8.2.1
pkgrel=1
pkgdesc="A dynamic and extendible menu-driven program launcher, using dmenu"
arch=('any')
url="http://mcfadzean.org.uk/appstogo/linux.html#supermenu"
license=('MIT')
depends=('dmenu')
optdepends=('gksu' 'gxmessage' 'wine')
backup=('etc/supermenu.conf')
source=("http://mcfadzean.org.uk/appstogo/dl/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('4338d3ddd205c53de9e2576eb6947ca7')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # script
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

  # configuration
  install -Dm644 $pkgname.conf "$pkgdir/etc/$pkgname.conf"
  msg "Remember to customize $pkgname.conf after installation"
  
  # licensing
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
