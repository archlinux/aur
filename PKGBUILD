# Contributor: Patrick Mischke

pkgname='python-arc-alkali-rydberg-calculator'
_name='ARC-Alkali-Rydberg-Calculator'
pkgver=3.10.2
pkgrel=2
pkgdesc="Calculations of single- and two-atom properties for alkali metal and divalent atoms."
url="https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator"
depends=('python-scipy' 'python-numpy' 'python-matplotlib' 'python-sympy' 'python-lmfit' 'python-rich')
makedepends=()
license=('BSD-3-Clause')
arch=('any')
source=("https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('bb5c47e8e49a278660884d127d0a8b48a41bf3fe33ad35df70810d0c46999acb')

build() {
  cd "$_name-v.$pkgver"
  python setup.py build
}

package() {
  cd "$_name-v.$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
