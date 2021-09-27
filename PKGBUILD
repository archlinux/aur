# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=python-playwright
_name=${pkgname#python-}
_py=py3
pkgver=1.15.0
pkgrel=1
pkgdesc="a Python library to automate Chromium, Firefox and WebKit browsers with a single API"
arch=(x86_64)
url=https://github.com/microsoft/playwright-python
license=(Apache)
makedepends=('python-pip' 'python-wheel')
depends=('python' 'python-greenlet' 'python-pyee' 'python-typing_extensions')
source=(
  "https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl"
)
sha256sums=(
  'b2619003000c769fb028f5fd4465f5985c8a0865b8bace935896698843e9b747'
)

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  python -O -m compileall "${pkgdir}"
}
