# Contributor: Patrick Mischke

pkgname='python-arc-alkali-rydberg-calculator'
_name='ARC-Alkali-Rydberg-Calculator'
pkgver=3.6.0
pkgrel=1
pkgdesc="Calculations of single- and two-atom properties for alkali metal and divalent atoms."
url="https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator"
depends=('python-scipy' 'python-numpy' 'python-matplotlib' 'python-sympy' 'python-lmfit')
makedepends=()
license=('BSD-3-Clause')
arch=('any')
source=("https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('611514f55b1ede25ca2d33bcffe31e6882d7139c5471a33c49f38631d9ce42b0')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
