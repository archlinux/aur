# Maintainer: Pierre Chapuis <arch@catwell.info>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname="python-wimpy"
pkgver=0.6
pkgrel=3
pkgdesc="Personal Python libraries of @wimglenn"
arch=("any")
url="https://github.com/wimglenn/wimpy"
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("014d21a31980eab48b92c4210e9fdba643b79f7081c64ea9bc97f2be9db9bd58")
depends=("python")
makedepends=("python-setuptools")

build() {
  cd "wimpy-$pkgver"
  python setup.py build
}

package() {
  cd "wimpy-$pkgver"
  python setup.py install --root="$pkgdir" -O1
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
