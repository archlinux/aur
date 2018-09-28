# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gixy
pkgver=0.1.20
pkgrel=1
pkgdesc='Nginx configuration static analyzer'
arch=('any')
url=https://github.com/yandex/gixy
license=('MPL2')
depends=('python-argparse' 'python-cached-property' 'python-configargparse' 'python-jinja' 'python-pyparsing' 'python-six')
source=("https://files.pythonhosted.org/packages/source/g/gixy/gixy-$pkgver.tar.gz")
sha512sums=('e2d853c78d8dce6a46e3dffb8f27e0d975915664977526c722b33a2e3146feaf07f25d02f3d28abefecd1a0751d1687b05773a8891d0b83f7f36e81512c5395a')

build() {
  cd gixy-$pkgver
  python setup.py build
}

package() {
  cd gixy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
