# Maintainer: sitiyou <sitiyou7@gmail.com>

pkgname=python-asslayer
_pkgname=asslayer
pkgver=0.2.0
pkgrel=1
pkgdesc="Wayland desktop overlay for ASS subtitles and libplacebo shader Hooks"
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
  'libplacebo>=6.338'
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
sha256sums=('de2c428c074ac0c33757175823637f0fbc7aa3bd964b8b121b7092f7ffec1e7c')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
