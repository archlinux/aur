# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-patchelf
_name="${pkgname#python-}"
pkgver=0.19.1.0
pkgrel=1
pkgdesc="Patchelf Python wheel for PyPI."
arch=('any')
url="https://github.com/mayeut/patchelf-pypi"
license=('Apache-2.0')
depends=(
  'patchelf'
  'python'
)
makedepends=(
  'python-installer'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-manylinux1_x86_64.manylinux_2_5_x86_64.musllinux_1_1_x86_64.whl")
sha256sums=('a8f6331ccf40c345507279f755f4a38c2cb00b9efda746fd43c17713cce0aba4')

package() {
  python -m installer --destdir="$pkgdir" *.whl

  # We only need dist-info, remove binary provided by patchelf package
  rm -rf "$pkgdir/usr/bin"
}
