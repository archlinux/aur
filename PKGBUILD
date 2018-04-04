# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gixy
pkgver=0.1.9
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url=https://github.com/yandex/gixy
license=('MPL2')
depends=('python-argparse' 'python-cached-property' 'python-configargparse' 'python-jinja' 'python-pyparsing' 'python-six')
source=("https://files.pythonhosted.org/packages/source/g/gixy/gixy-$pkgver.tar.gz")
sha512sums=('ba1ea71c205e5f520dcf22b2adc2eb1125623beae82f843b5da1934c33a93a11d850112ae388269bc3aed770709b844d23c4a0908a1eb134cfb5ef6431655b0c')

build() {
  cd gixy-$pkgver
  python setup.py build
}

package() {
  cd gixy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
