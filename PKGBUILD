# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=wallepy
pkgver=0.03
pkgrel=2
pkgdesc="An automatic wallpaper getter and setter using feh"
arch=('any')
url="https://github.com/brandonio21/wallepy"
license=('MIT')
depends=('python>=3' 'python-click')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('df039f0fe1d9a2cc23e48209beff7e504b69b6613491eae03a0a07ce78a9e54f')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/systemd/user

  install walle.py $pkgdir/usr/bin
  cp wallepy.service $pkgdir/usr/lib/systemd/user
  cp wallepy.timer $pkgdir/usr/lib/systemd/user
}
