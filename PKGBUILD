# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=nmrglue
pkgname=python-$_pkgname
pkgver=0.9
pkgrel=1
pkgdesc="A module for working with NMR data in Python"
arch=('any')
url="http://www.nmrglue.com"
license=('BSD')
depends=('python-scipy' 'python-matplotlib' 'python-ipywidgets')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"https://github.com/jjhelmus/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa721dd9b5675ca0101288727a55af8d8870f7f01a83251798057c1020cb24c3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
  install -Dm755 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
