# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=python-playwright
_name=${pkgname#python-}
_py=py3
pkgver=1.11.0
pkgrel=1
pkgdesc="a Python library to automate Chromium, Firefox and WebKit browsers with a single API"
arch=(x86_64)
url=https://github.com/microsoft/playwright-python
license=(Apache)
makedepends=('python-pip' 'python-wheel')
depends=('python' 'python-greenlet' 'python-pyee' 'python-typing_extensions')
source=(
  "https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-none-manylinux_2_27_x86_64.whl"
)
sha256sums=(
  'a41080022622612b53d97190f2eaae5dbb4e2051fdc8da6541f170fee0fa82a6'
)

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  python -O -m compileall "${pkgdir}"
}
