# Contributor: Patrick Mischke

pkgname='python-rsinstrument'
_name='RsInstrument'
pkgver=1.90.0.108
_commit="ea8d622caf08eb3ecf4caaed78a41605e5427afc"
pkgrel=1
pkgdesc="Convenient way of communicating with R&S instruments in python"
url="https://github.com/Rohde-Schwarz/RsInstrument"
depends=('python-pyvisa' 'rs-visa')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/Rohde-Schwarz/$_name/archive/$_commit.zip")
sha256sums=('c7753a25506e2d5621b6225bd4c0309f9a2ac92b0af8da768f93ab5d9223968c')

build() {
  cd "$_name-$_commit"
  python setup.py build
}

package() {
  cd "$_name-$_commit"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
