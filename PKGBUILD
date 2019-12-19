# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Alexander F Rødseth <rodseth@gmail.com>

# Based on python-clint in [community]

_name=clint
pkgname=python2-$_name
pkgver=0.5.1
pkgrel=9
pkgdesc='Module for developing command line applications'
arch=('any')
url="https://pypi.org/project/$_name/"
license=('custom:ISC')
depends=('python2')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('05224c32b1075563d0b16d0015faaf9da43aa214e4a2140e51f08789e7a4c5aa')

build() {
  cd $_name-$pkgver

  python2 setup.py build
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build \
    --install-data="/usr/share/doc/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
