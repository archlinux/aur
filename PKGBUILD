# Maintainer: Clayton Craft <clayton at craftyguy dot net>

pkgname=python-py-spy
pkgver=0.1.7
pkgrel=1
pkgdesc="Sampling profiler for Python programs"
arch=('any')
license=('GPL3')
url="https://github.com/benfred/py-spy"
depends=('python' 'python-setuptools-rust' 'rust')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/benfred/py-spy/archive/v$pkgver.tar.gz")
sha512sums=('c47901f9bc2d823099e5c79872684be6ff5b321456c7d996f69099e7a11a371f71aff2d34e4b98bc15460a309039518472e5128ba3f3b8ab91ca99fa9b3c2715')

package() {
  cd py-spy-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
