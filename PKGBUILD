# Contributor: Patrick Mischke

pkgname='python-mkl'
pkgver=2025.2.0
pkgrel=1
pkgdesc="Intel® oneAPI Math Kernel Library"
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/onemkl.html"
depends=('intel-oneapi-mkl' 'python')
makedepends=('python-pip')
license=('custom:IntelSimplifiedSoftwareLicense')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/46/7b/f5b1b84eb0a2a6e145fc31b4e6b1c59690dcb088734197da8f299caf7c67/mkl-2025.2.0-py2.py3-none-manylinux_2_28_x86_64.whl" "LICENSE.txt")

sha256sums=("974b4e222cc94e8d3b67213a361c8ac25d432cc4fccc5f2f00aa15c4e67cc203" "ea02a6819db8514ff50fbfcaa94cd771be38e7bf42ef96de49c091c6d31b449e")

package() {
  install -Dm644 "$srcdir/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps mkl-2025.2.0-py2.py3-none-manylinux_2_28_x86_64.whl
}
