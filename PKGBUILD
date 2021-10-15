# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zxpy
pkgver=1.5.0
pkgrel=1
pkgdesc="Shell scripts made simple"
arch=('any')
url="https://github.com/tusharsadhwani/zxpy"
license=("MIT")
depends=("python")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('83fdbf1f14e2ce6253dc402d72ba33440c8a11b44dec8766344394a0c6ba787280f0469f4c3164ec6ace6ac720ff0906a7066757a5c5a2a119901e10167b4585')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
