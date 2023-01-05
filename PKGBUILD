# Maintainer: Anes Belfodil <ans.belfodil@gmail.com>
pkgname=randwall-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Randomly changes desktop wallpaper'
arch=('x86_64')
url='https://github.com/arch-anes/randwall'
license=('MIT')
depends=()
source=("$pkgname-$pkgver-$pkgrel.tar.xz::https://github.com/arch-anes/randwall/releases/download/v$pkgver/randwall_standalone_linux-x64.tar.gz")
sha256sums=('SKIP')

package() {
  install -d $pkgdir/usr/bin
  install -Dm755 $srcdir/randwall $pkgdir/usr/bin

  install -d $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 $srcdir/../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -Dm644 $srcdir/../randwall.service $pkgdir/usr/lib/systemd/user/randwall.service
  install -Dm644 $srcdir/../randwall@.service $pkgdir/usr/lib/systemd/system/randwall@.service
}
