# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=sip
pkgname=sip-65
pkgver=6.5.1
pkgrel=1
arch=(x86_64)
pkgdesc='A tool that makes it easy to create Python bindings for C and C++ libraries'
url='https://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
depends=(python-toml python-packaging python-setuptools)
provides=(sip)
conflicts=(sip sip5)
replaces=(sip5)
source=(https://pypi.python.org/packages/source/s/sip/$_pkgname-$pkgver.tar.gz)
sha256sums=('204f0240db8999a749d638a987b351861843e69239b811ec3d1881412c3706a6')
options=(debug)

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
