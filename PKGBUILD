# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gixy
pkgver=0.1.8
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url=https://github.com/yandex/gixy
license=('custom:MPLv2')
depends=('python-argparse' 'python-cached-property' 'python-configargparse' 'python-jinja' 'python-pyparsing' 'python-six')
checkdepends=('python-nose')
source=("gixy-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b55e60b5ae01481adc30e725dd7fd15bf66a27790756780a13001f2c3e684ee187c64ffca93f8d143ca172db10d6511bf7242d0c4feece74a7cbb3380e18e0c5')

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
