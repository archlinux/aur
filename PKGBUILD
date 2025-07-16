# Contributor: Patrick Mischke

pkgname='python-arc-alkali-rydberg-calculator'
_name='ARC-Alkali-Rydberg-Calculator'
pkgver=3.9.0
pkgrel=1
pkgdesc="Calculations of single- and two-atom properties for alkali metal and divalent atoms."
url="https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator"
depends=('python-scipy' 'python-numpy' 'python-matplotlib' 'python-sympy' 'python-lmfit' 'python-rich')
makedepends=()
license=('BSD-3-Clause')
arch=('any')
source=("https://github.com/nikolasibalic/ARC-Alkali-Rydberg-Calculator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a4a9ac1bfc7cada551ae103817f99c439ee209c778877f6092d88ea7f0fe26ad')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
