# Maintainer: Sergey M <tz4678@gmail.com>
pkgname=random-wallpaper
pkgver=0.1.0
pkgrel=1
pkgdesc='Changes the desktop wallpaper to random from the site wallhaven.cc'
arch=('any')
url='https://github.com/tz4678/random-wallpaper'
license=('MIT')
depends=('jq')
source=('git+https://github.com/tz4678/random-wallpaper.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
  install -Dm644 $pkgname.timer $pkgdir/usr/lib/systemd/system/$pkgname.timer
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
