# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-cycler
pkgver=0.11.0
pkgrel=1
pkgdesc="Composable style cycles"
arch=('any')
license=('BSD')
url="https://github.com/matplotlib/cycler"
depends=('python38-six')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("https://github.com/matplotlib/cycler/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('cdf91b861d20710b3d77ad105e54668fafa4be69e566d6a09683c638a35aa423b542a141ca0bbffd7a6cd30c8e2a629d578be88648ab9f38a0c43405f2f39613')

build() {
  cd cycler-$pkgver
  python3.8 setup.py build
}

check() {
  cd cycler-$pkgver
  pytest
}

package() {
  cd cycler-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
