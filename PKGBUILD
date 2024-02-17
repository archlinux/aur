# Maintainer: Fernando Carmona Varo <philip.goto@gmail.com>

pkgname=vengi-voxel-git
pkgver=0.0.28.r291.gfd7b13fb1
pkgrel=1
pkgdesc='voxel art tools - editor, thumbnailer and format converter'
arch=(i686 x86_64 armv7h aarch64)
license=('MIT')
url='https://vengi-voxel.github.io/vengi/'
depends=(sdl2 lua)
makedepends=(git make cmake)
conflicts=()
provides=()
source=("git+https://github.com/vengi-voxel/vengi.git")
sha256sums=(SKIP)

pkgver() {
  cd vengi
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd vengi
  make release
}

package() {
  install -Dm755  -t "$pkgdir/usr/bin/" \
    vengi/build/voxedit/vengi-voxedit \
    vengi/build/voxconvert/vengi-voxconvert \
    vengi/build/voxbrowser/vengi-voxbrowser \
    vengi/build/thumbnailer/vengi-thumbnailer \
    vengi/build/shadertool/vengi-shadertool \
    vengi/build/formatprinter/vengi-formatprinter
}


