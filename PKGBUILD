# Contributor: Patrick Mischke

pkgname='python-arc-alkali-rydberg-calculator'
_name='ARC-Alkali-Rydberg-Calculator'
pkgver=3.3.0
pkgrel=1
pkgdesc="Perform calculations of single- and two-atom properties for alkali metal and divalent atoms."
url="https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator"
depends=('python-scipy' 'python-oldest-supported-numpy' 'python-matplotlib' 'python-sympy' 'python-lmfit')
makedepends=()
license=('BSD')
arch=('any')
source=("https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8040916c757302d6abe625e5d0241895fb2f2c54932dcade421d827e0c20297a')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
