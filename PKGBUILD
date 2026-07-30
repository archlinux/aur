# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp-bin
_name=zxing_cpp
pkgver=3.1.1
pkgrel=1
pkgdesc="Python bindings for zxing-cpp"
arch=('x86_64' 'aarch64')
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
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
_py=cp314
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name}-$pkgver-$_py-${_py}t-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name}-$pkgver-$_py-${_py}t-manylinux_2_26_aarch64.manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('388626ac8df24f63c2bb17dcd42fd21daeeea6fd6759bd9b1c064b71142da07e')
sha256sums_aarch64=('71df8523deb2fb40b834238e6fa739e210e3a6e27c5b94a99b4106c08e339b9b')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
