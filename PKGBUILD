# Contributor: Patrick Mischke

pkgname='python-rsinstrument'
_name='RsInstrument'
pkgver=1.70.0.102
_commit="02cf5efc187596fff4120859e6c6e77caad5a666"
pkgrel=2
pkgdesc="Convenient way of communicating with R&S instruments in python"
url="https://github.com/Rohde-Schwarz/RsInstrument"
depends=('python-pyvisa' 'rs-visa')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/Rohde-Schwarz/$_name/archive/$_commit.zip")
sha256sums=('ef4cbecbd4d845e6daed01fda1a3c36b50d1b9c244dae34a6efad675313f9fa7')

build() {
  cd "$_name-$_commit"
  python setup.py build
}

package() {
  cd "$_name-$_commit"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
