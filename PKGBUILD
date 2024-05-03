# Contributor: Patrick Mischke

pkgname='python-arc-alkali-rydberg-calculator'
_name='ARC-Alkali-Rydberg-Calculator'
pkgver=3.4.0
pkgrel=2
pkgdesc="Perform calculations of single- and two-atom properties for alkali metal and divalent atoms."
url="https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator"
depends=('python-scipy' 'python-oldest-supported-numpy' 'python-matplotlib' 'python-sympy' 'python-lmfit')
makedepends=()
license=('BSD-3-Clause')
arch=('any')
source=("https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eb6b01b0c9f2dec9c3c6d70cf7f56f582023ca6ec0caf42a6ff03fd8e0f76aed')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
