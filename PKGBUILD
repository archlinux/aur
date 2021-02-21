# Maintainer: SZanko  <szanko at protonmail dot com>
pkgname=python-dictdiffer
pkgver=0.8.1
pkgrel=2
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
md5sums=('3185fe683d976282bf6313de14b7c7e9')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
