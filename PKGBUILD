# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor:  Francesco Masala <mail@francescomasala.me>

pkgname=bottles
pkgver=2021.7.14
pkgrel=1
pkgdesc='Easily manage wine and proton prefix'
arch=('x86_64')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=(
  'hicolor-icon-theme' 
  'dconf' 
  'python' 
  'libhandy' 
  'gtk3' 
  'python-gobject' 
  'python-requests' 
  'python-yaml' 
  'samba' 
  'wine' 
  'cabextract')
optdepends=(
  'gvfs' 
  'vkd3d' 
  'lib32-vkd3d' 
  'lib32-vulkan-icd-loader' 
  'vulkan-icd-loader'
  'gamemode')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}-treviso.tar.gz::https://github.com/bottlesdevs/Bottles/archive/${pkgver}-treviso.tar.gz")
sha256sums=('a69e464817069a21626917ad3620dd4b02527bdf3510729af71d0e8a81cf5b9e')

build() {
  cd "Bottles-${pkgver}-treviso"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Bottles-${pkgver}-treviso"
  DESTDIR="${pkgdir}" ninja -C build install
}
