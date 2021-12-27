# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-nvfbc
pkgver=0.0.5
pkgrel=1
pkgdesc="OBS Studio source plugin for NVIDIA FBC API"
arch=('x86_64')
license=('GPL2')
url="https://obsproject.com/forum/resources/obs-nvfbc.796/"
depends=('obs-studio')
optdepends=('nvidia-utils-nvlax: enable NvFBC on GeForce cards')
makedepends=('git' 'meson')
source=("git+https://gitlab.com/fzwoch/obs-nvfbc.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  meson "$srcdir/$pkgname" build --prefix=/usr
  ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}