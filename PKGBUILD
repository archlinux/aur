# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-patchelf
_name="${pkgname#python-}"
pkgver=0.19.3.0
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
sha256sums=('1668a30fcc414debbb1604cd0a361b2f28a33a0ff6e74a74bc71766ee746e21f')

package() {
  python -m installer --destdir="$pkgdir" *.whl

  # We only need dist-info, remove binary provided by patchelf package
  rm -rf "$pkgdir/usr/bin"
}
