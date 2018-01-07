# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pycoinmon
pkgver=0.4.0
pkgrel=1
pkgdesc='Cryptocurrency price tool on CLI (Python version)'
arch=('any')
url=https://github.com/RDCH106/pycoinmon
license=('MIT')
depends=('python-colorama' 'python-humanize' 'python-requests' 'python-tabulate')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('317dbc234d6b7e773fdd6050c40a56aa8e814672cabe6d3aa8958e263ad3140e44eb1f1a3d326c7a45fdcbce65ec45986eeb37bd5e878fc3c4e7dcab4779cf67')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  python -m unittest discover tests
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
