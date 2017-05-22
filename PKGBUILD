# Maintainer: Holly Becker <becker.holly@gmail.com>
pkgname=fido
pkgver=1.3.5_88
pkgrel=2
pkgdesc="Command-line tool to identify the file formats of digital objects."
arch=('any')
url="http://openpreservation.org/technology/products/fido/"
license=('Apache')
depends=(
  'python2>=2.6'
  'python2-six=1.10.0'
  'python2-olefile>=0.4'
  'python2-olefile<1')
provides=('fido')
options=(!emptydirs)
source=("https://github.com/openpreserve/$pkgname/archive/v${pkgver//_/-}.tar.gz")
md5sums=('0cc6ddf5dfc06b2d1b5861d3949a9e62')

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

