# Contributor: Patrick Mischke

pkgname='python-mkl'
pkgver=2025.0.1
pkgrel=1
pkgdesc="Intel® oneAPI Math Kernel Library"
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/onemkl.html"
depends=('intel-oneapi-mkl' 'python')
makedepends=('python-pip')
license=('custom:IntelSimplifiedSoftwareLicense')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/bd/d7/a86e897657596eaadc0f76b1dcde823451cdc4877fc39a8211a47f862202/mkl-2025.0.1-py2.py3-none-manylinux_2_28_x86_64.whl" "LICENSE.txt")

sha256sums=("581b3de496bd004ab2d2bd38775bbcc885303270687940848a19747cce45d47b" "ea02a6819db8514ff50fbfcaa94cd771be38e7bf42ef96de49c091c6d31b449e")

package() {
  install -Dm644 "$srcdir/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps mkl-2025.0.1-py2.py3-none-manylinux_2_28_x86_64.whl
}
