# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gixy
pkgver=0.1.9
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url=https://github.com/yandex/gixy
license=('custom:MPLv2')
depends=('python-argparse' 'python-cached-property' 'python-configargparse' 'python-jinja' 'python-pyparsing' 'python-six')
checkdepends=('python-nose')
source=("gixy-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('adee99151330ff1f6aa4bed6baca6e54489c4e57eab692e716a7fd1e9aa78d80360aa3778dc1e1ab588ef2c03b9b98d69469f9dc1a5d039dff90606e2ed2f6bc')

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
