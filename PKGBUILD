# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp-bin
_name=zxing_cpp
pkgver=3.2.0
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
sha256sums_x86_64=('662ce77e74c3556fb9282fa897ea9afb1b8bae2b5b64d33f531baf8dda9f2f92')
sha256sums_aarch64=('7a6bf41bcbf6cb1a732e88778e0763eb2e2bacae349b4abb825b653beefa3a9f')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
