# Contributor: Patrick Mischke

pkgname='python-mkl'
pkgver=2025.3.1
pkgrel=1
pkgdesc="Intel® oneAPI Math Kernel Library"
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/onemkl.html"
depends=('intel-oneapi-mkl' 'python')
makedepends=('python-pip')
license=('custom:IntelSimplifiedSoftwareLicense')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/b3/ee/76755ca0ec9626835e0d024c369b968f24eadce2106a7884404720670623/mkl-2025.3.1-py2.py3-none-manylinux_2_28_x86_64.whl" "LICENSE.txt")

sha256sums=("db31e59fa368dd4fa45b494351f4b7e0e6204b08d7db27836118c4e1370eb011" "ea02a6819db8514ff50fbfcaa94cd771be38e7bf42ef96de49c091c6d31b449e")

package() {
  install -Dm644 "$srcdir/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps mkl-$pkgver-py2.py3-none-manylinux_2_28_x86_64.whl
}
