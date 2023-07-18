# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=python-playwright
_name=${pkgname#python-}
_py=py3
pkgver=1.36.0
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
  '72e80076e595f5fcd8ebd89bf6635ad78e4bafa633119faed8b2568d17dbd398'
)

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  python -O -m compileall "${pkgdir}"
}
