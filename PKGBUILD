# Maintainer: SZanko  <szanko at protonmail dot com>
pkgname=python-dictdiffer
pkgver=0.9.0
pkgrel=1
pkgdesc="Dictdiffer is a library that helps you to diff and patch dictionaries"
url="https://github.com/inveniosoftware/dictdiffer"
license=('MIT')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
arch=('any')
makedepends=(
	'python-setuptools'
	'python-pip'
	'binutils'
)
depends=('python')
md5sums=('524b353b969300d4dc6aa6720c953657')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
