# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-configargparse
pkgver=0.15.1
pkgrel=1
pkgdesc='A drop-in replacement for argparse that allows options to also be set via config files and/or environment variables'
arch=(any)
url='https://github.com/bw2/ConfigArgParse'
license=(MIT)
depends=(python2)
optdepends=('python2-yaml: for YAML support')
makedepends=(python2-setuptools)
checkdepends=(python2-yaml python2-mock)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('40e7e60fe222a1c3679c878382b610a58c217483258a033ec8ed6cbd7ca3b870')

build() {
  cd "$srcdir"/ConfigArgParse-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/ConfigArgParse-$pkgver
  python2 setup.py test
}

package() {
  cd ConfigArgParse-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
