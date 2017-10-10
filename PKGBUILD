# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=gixy
pkgver=0.1.7
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url=https://github.com/yandex/gixy
license=('custom:MPLv2')
depends=('python-argparse' 'python-cached-property' 'python-configargparse' 'python-jinja' 'python-pyparsing' 'python-six')
checkdepends=('python-nose')
source=("gixy-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('eb1707c18e32155f92dd81ce2952573625d72d029fb4e991ae3171f56399ee6c9e63b3d0079fc46c78573f139f06b2ed9bbded70653cca40f187408c88a3344e')

build() {
  cd gixy-$pkgver
  python setup.py build
}

check() {
  cd gixy-$pkgver
  nosetests
}

package() {
  cd gixy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/gixy/LICENSE
}

# vim:set ts=2 sw=2 et:
