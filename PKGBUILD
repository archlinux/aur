# Maintainer: zjuyk <ownbyzjuyk@gmail.com>
 
pkgname=('python-image-go-nord')
pkgver=0.1.5
pkgrel=1
_appname=ImageGoNord-pip
pkgdesc='A tool that can convert your rgb images to nordtheme palettei.'
arch=('x86_64')
license=('MIT')
url='https://github.com/Schrodinger-Hat/ImageGoNord-pip'
depends=('python-pillow')
makedepends=('python-setuptools')
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/Schrodinger-Hat/$_appname/archive/v$pkgver.tar.gz")
sha512sums=('c81645f646e38bdf7ca8dd26e582f7196f38da36f197934696ae858fb062a96c331e7ee8903b3d58d209e83949cddb4b8d7bc062e4ab3f8617b248a1447b8590')
 
prepare() {
  cd "$srcdir/$_appname-$pkgver"
}
 
build() {
  cd "$srcdir"/$_appname-$pkgver
  python setup.py build
}
 
package() {
  cd "$srcdir/$_appname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
 
# vim:set ts=2 sw=2 et:
