# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('azote')
pkgver=1.7.10
pkgrel=1
pkgdesc="Wallpaper & color manager for Sway, i3 and other WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/azote"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-gobject' 'python-pillow' 'python-send2trash' 'gtk3' 'feh' 'xorg-xrandr')
optdepends=('grim: for screen color picker on Sway'
			'slurp: for screen color picker on Sway'
			'maim: for screen color picker on X11'
			'imagemagick: for screen color picker on X11 and Sway'
			'python-yaml: for alacritty.yml toolbox')

source=("https://github.com/nwg-piotr/azote/archive/v$pkgver.tar.gz")

md5sums=('2297ffcb45eff5207fa5584621e939d6')

package() {
  install -D -m 755 "$pkgname"-"$pkgver"/dist/azote-arch "$pkgdir"/usr/bin/azote
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/dist/azote.svg
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/dist/indicator*.png
  install -D -t "$pkgdir"/usr/share/applications "$pkgname"-"$pkgver"/dist/azote.desktop
  install -Dm 644 "$pkgname"-"$pkgver"/LICENSE-COLORTHIEF "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-COLORTHIEF"
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

