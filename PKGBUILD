# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=wallepy
pkgver=0.05
pkgrel=1
pkgdesc="An automatic wallpaper getter and setter using feh"
arch=('any')
url="https://github.com/brandonio21/wallepy"
license=('MIT')
depends=('python>=3' 'python-click' 'feh')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('731f1a3977c66b552799c99418478edd517281e1d9b84d453a07d95f123e0761')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/systemd/user

  install walle.py $pkgdir/usr/bin
  cp wallepy.service $pkgdir/usr/lib/systemd/user
  cp wallepy.timer $pkgdir/usr/lib/systemd/user
}
