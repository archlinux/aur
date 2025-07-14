# Contributor: Patrick Mischke

pkgname='python-arc-alkali-rydberg-calculator'
_name='ARC-Alkali-Rydberg-Calculator'
pkgver=3.8.1
pkgrel=2
pkgdesc="Calculations of single- and two-atom properties for alkali metal and divalent atoms."
url="https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator"
depends=('python-scipy' 'python-numpy' 'python-matplotlib' 'python-sympy' 'python-lmfit' 'python-rich')
makedepends=()
license=('BSD-3-Clause')
arch=('any')
source=("https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('9c0b1a83e3550d83d30a5d9ae928a3774f309ca05203a3d06090fb39668ec179')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
