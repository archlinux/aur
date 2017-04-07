# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=wallepy
pkgver=0.04
pkgrel=2
pkgdesc="An automatic wallpaper getter and setter using feh"
arch=('any')
url="https://github.com/brandonio21/wallepy"
license=('MIT')
depends=('python>=3' 'python-click' 'feh')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('bec90be3bcaeb2c7ed3e2498bfa8331f7cc533b12eb5894042a8e2ef2cd1998d')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/systemd/user

  install walle.py $pkgdir/usr/bin
  cp wallepy.service $pkgdir/usr/lib/systemd/user
  cp wallepy.timer $pkgdir/usr/lib/systemd/user
}
