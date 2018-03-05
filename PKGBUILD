# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pycoinmon
pkgver=0.4.7
pkgrel=1
pkgdesc='Cryptocurrency price tool on CLI (Python version)'
arch=('any')
url=https://github.com/RDCH106/pycoinmon
license=('MIT')
depends=('python-colorama' 'python-humanize' 'python-py-spin' 'python-requests' 'python-tabulate')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('92a237926907e80bcc39fc8f7b853d373579366ec37c54af4d87a9a6b6fcb37fdffd63e3456c2a35322ee0f7535464436d67d5a597748c394092857d4ff89aa8')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
