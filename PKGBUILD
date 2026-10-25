# Maintainer: sitiyou <sitiyou7@gmail.com>

pkgname=python-asslayer
_pkgname=asslayer
pkgver=0.1.0
pkgrel=1
pkgdesc="ASS subtitle desktop overlay for Wayland, rendered with libass and Vulkan"
arch=('x86_64')
url="https://github.com/sitiyou/asslayer"
license=('GPL-3.0-only')
depends=(
  'python>=3.14'
  'gcc-libs'
  'glibc'
  'wayland'
  'vulkan-driver'
  'vulkan-icd-loader'
  'libass'
  'fontconfig'
)
makedepends=(
  'meson'
  'meson-python'
  'ninja'
  'python-build'
  'python-installer'
  'python-wheel'
  'pybind11'
  'vulkan-headers'
  'shaderc'
)
source=("https://files.pythonhosted.org/packages/source/a/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c5cf1d72df9cc962fa78a7d3d25c3600be27175e78a537819fc58716330bc299')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
