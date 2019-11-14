# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('azote')
pkgver=1.7.4
pkgrel=2
pkgdesc="Wallpaper manager for Sway, i3 and some other WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/azote"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-gobject' 'python-pillow' 'gtk3' 'feh' 'xorg-xrandr')
optdepends=('python-send2trash: trash support'
			'grim: for screen color picker on Sway'
			'slurp: for screen color picker on Sway'
			'maim: for screen color picker on X11')

source=("https://github.com/nwg-piotr/azote/archive/v$pkgver.tar.gz"
        "https://github.com/nwg-piotr/azote/raw/master/dist/azote-arch")

md5sums=('48f6663cf85821fdfe84e4aa64a9caf7'
         'e9761894a505767bb3d7b6e42c00a752')

package() {
  install -D -m 755 azote-arch "$pkgdir"/usr/bin/azote
  install -D -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/dist/azote.svg
  install -D -t "$pkgdir"/usr/share/applications "$pkgname"-"$pkgver"/dist/azote.desktop
  install -Dm 644 "$pkgname"-"$pkgver"/LICENSE-COLORTHIEF "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-COLORTHIEF"
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

