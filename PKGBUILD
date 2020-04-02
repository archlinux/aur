# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-ntfs
pkgver=0.1.4
pkgrel=1
pkgdesc="Python module to manipulate NTFS junctions and hardlinks"
arch=('any')
license=('custom:MIT')
url="https://github.com/sunshowers/ntfs"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('80ada586fd132b1db9fc6b2a844b98f4e2a883cb26f115f6af2b58f84295da98')
depends=('python')

build() {
  cd ${pkgname#python-}-$pkgver
  python setup.py build
}

package() {
  cd ${pkgname#python-}-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
