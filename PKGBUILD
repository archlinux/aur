# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-expects
pkgver=0.9.0
pkgrel=9
pkgdesc="Expressive and extensible TDD/BDD assertion library for Python"
arch=('any')
license=('Apache')
url="https://github.com/jaimegildesagredo/expects"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-mamba')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaimegildesagredo/expects/archive/v$pkgver.tar.gz")
sha512sums=('f145ed9b1a8921ddc813640f1c6533f41a3dc0f14bf90a69409e0c600cae502cfa16237864103c7e67560f6831ab2db23955ce533439e4fd3b896f2c8c9e7cbb')

build() {
  cd expects-$pkgver
  python setup.py build
}

check() {
  cd expects-$pkgver
  mamba
}

package() {
  cd expects-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
