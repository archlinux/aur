# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=python2-sanction
pkgver=0.4.1
pkgrel=2
pkgdesc="A simple, lightweight OAuth2 client"
url="https://github.com/demianbrecht/sanction"
depends=( 'python2' )
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/s/sanction/sanction-$pkgver.tar.gz")
sha1sums=('bc2f4193f9de80bcaac2683ec986dfdf33cbfa38')

build() {
  cd $srcdir/sanction-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/sanction-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
