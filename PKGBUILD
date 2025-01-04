# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp-bin
_name=zxing_cpp
pkgver=2.3.0
pkgrel=1
pkgdesc="Python bindings for zxing-cpp"
arch=('x86_64')
url="https://github.com/zxing-cpp/zxing-cpp"
license=('Apache-2.0')
depends=(
  'python'
  'zxing-cpp'
)
makedepends=(
  'python-installer'
  'python-wheel'
)
provides=('python-zxing-cpp')
conflicts=('python-zxing-cpp')
_py=cp313
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_27_${CARCH}.manylinux_2_28_${CARCH}.whl")
sha256sums=('7ba641ca5a0f19b97d7bc6a0212e61dab267a2b1a52a84946d02bdcd859ec318')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
