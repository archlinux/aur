# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=python38-pickleshare
pkgver=0.7.5
pkgrel=8
pkgdesc="File system based database that uses python pickles"
arch=('any')
url="https://github.com/pickleshare/pickleshare"
license=('MIT')
depends=('python38')
makedepends=('python38-setuptools') 
source=("https://files.pythonhosted.org/packages/source/p/pickleshare/pickleshare-$pkgver.tar.gz")
sha256sums=('87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca')

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir/pickleshare-$pkgver"
  python38 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
