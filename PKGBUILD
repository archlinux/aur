# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-parameterized
pkgver=0.8.1
pkgrel=3
pkgdesc="Parameterized testing with any Python test framework"
url="https://github.com/wolever/parameterized"
license=('BSD')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-nose' 'python38-mock')
source=("https://github.com/wolever/parameterized/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('fb80d75c3d20bb9fe043072e14c89827ad94907d822edac90bee154088fe17d1ecd5df01e98e6a4764c8cdf85deb5eca9bbcdf9dc3756bf2c849453832b3c46e')

build() {
  cd parameterized-$pkgver
  python3.8 setup.py build
}

check() {
  cd parameterized-$pkgver
  python3.8 setup.py nosetests
}

package() {
  cd parameterized-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
