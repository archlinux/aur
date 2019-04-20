# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('squarely')
pkgver=0.9
pkgrel=8
pkgdesc="Puzzle game written in Python using the pyglet library"
arch=('i686' 'x86_64')
url="https://github.com/nwg-piotr/squarely"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-pyglet' 'python-requests' 'openal')
optdepends=('avbin7: for compressed sound playback')
source=("https://github.com/nwg-piotr/squarely/raw/master/dist/squarely-0.9.tar.gz"
        "https://github.com/nwg-piotr/squarely/raw/master/dist/squarely"
        "https://github.com/nwg-piotr/squarely/raw/master/dist/squarely.svg"
        "https://github.com/nwg-piotr/squarely/raw/master/dist/squarely.desktop")

md5sums=('de2fe090222f09aa7ae5e66947f68453'
         '8a910f0a5ecf156cc6856bd9b636143d'
         'a87a406cab2e66a0efaba87deffa2175'
         '795bf57c86be1a38812ec7b4716d8729')

package() {
  install -D -m 755 squarely \
 	 "$pkgdir"/usr/bin/squarely
  install -D -m 755 squarely.desktop \
 	 "$pkgdir"/usr/share/applications/squarely.desktop
  install -D -m 644 squarely.svg \
 	 "$pkgdir"/usr/share/squarely/squarely.svg
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
