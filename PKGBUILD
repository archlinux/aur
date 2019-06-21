# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('azote')
pkgver=0.1.0
pkgrel=1
pkgdesc="Wallpaper manager for Sway, i3 and some other WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/azote"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-gobject' 'python-pillow' 'python-send2trash' 'wget' 'feh' 'xorg-xrandr' 'wmctrl')

source=("https://github.com/nwg-piotr/azote/archive/v0.1.0.tar.gz")

md5sums=('4c028397908a2e7e99db930e900c0b27')

package() {
  install -D -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"/dist/azote
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/dist/azote.svg
  install -D -t "$pkgdir"/usr/share/applications/"$pkgname" "$pkgname"-"$pkgver"/dist/azote.desktop
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}