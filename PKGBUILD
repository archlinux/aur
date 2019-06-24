# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('azote')
pkgver=1.0.0
pkgrel=1
pkgdesc="Wallpaper manager for Sway, i3 and some other WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/azote"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-gobject' 'python-pillow' 'gtk3' 'wget' 'feh' 'xorg-xrandr' 'wmctrl')
optdepends=('python-send2trash: trash support')

source=("https://github.com/nwg-piotr/azote/archive/v1.0.0.tar.gz")

md5sums=('3f41a42a6ba9f3c8b0fd1edb3a1c7125')

package() {
  install -D -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"/dist/azote
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/dist/azote.svg
  install -D -t "$pkgdir"/usr/share/applications/"$pkgname" "$pkgname"-"$pkgver"/dist/azote.desktop
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}