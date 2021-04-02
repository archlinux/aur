# Maintainer: lmartinez-mirror
pkgname=python-icecream
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Sweet and creamy print debugging"
arch=('any')
url="https://github.com/gruns/icecream"
license=('MIT')
groups=()
depends=('python-colorama>=0.3.9' 'python-pygments>=2.2.0' 'python-executing>=0.3.1' 'python-asttokens>=2.0.1')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('434e14a50da01f9dc1e5757efec7613db5df048ebdcecd460236db41688f779a')
validpgpkeys=()

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
