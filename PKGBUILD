# Contributor: Patrick Mischke

pkgname='python-rsinstrument'
_name='RsInstrument'
pkgver=1.55.0.99
_commit="1d62deb1c662ce40290e427d4bebf835a7a78e6a"
pkgrel=1
pkgdesc="Convenient way of communicating with R&S instruments in python"
url="https://github.com/Rhode-Schwarz/RsInstrument"
depends=('python-pyvisa')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/Rohde-Schwarz/$_name/archive/$_commit.zip")
sha256sums=('7437185a85665cfe6e97a751da8f366097bfabed5b0117e5b0a21accd0ed15b7')

build() {
  cd "$_name-$_commit"
  python setup.py build
}

package() {
  cd "$_name-$_commit"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
