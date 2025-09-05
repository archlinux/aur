# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=cleanpy
pkgver=0.5.1
pkgrel=1
pkgdesc='CLI tool to remove caches and temporary files related to Python'
arch=('any')
url='https://github.com/thombashi/cleanpy'
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$pkgname"
  python setup.py build
}

# Uncomment if you want to run tests and if they work properly in build environment
# check() {
#   cd "$pkgname"
#   python setup.py test
# }

package() {
  cd "$pkgname"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
