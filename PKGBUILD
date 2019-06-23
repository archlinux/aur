# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('azote')
pkgver=0.1.3
pkgrel=1
pkgdesc="Wallpaper manager for Sway, i3 and some other WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/azote"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-gobject' 'python-pillow' 'python-send2trash' 'gtk3' 'wget' 'feh' 'xorg-xrandr' 'wmctrl')

source=("https://github.com/nwg-piotr/azote/archive/v0.1.3.tar.gz")

md5sums=('141a3a679da1e871fe0d07edc2452be8')

package() {
  install -D -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"/dist/azote
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/dist/azote.svg
  install -D -t "$pkgdir"/usr/share/applications/"$pkgname" "$pkgname"-"$pkgver"/dist/azote.desktop
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}