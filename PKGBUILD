# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=drm_tool
pkgver=r2.ge350706
pkgrel=1
pkgdesc="A small tool for querying and setting DRM properties of /dev/dri/card* devices"
arch=(i686 x86_64)
url="https://github.com/NickCis/drm_tool"
license=(GPL3)
depends=(libdrm)
makedepends=(git)
_commit=e3507068b885172c1f6da4c02788b0d2b0cb5477
source=("git+https://github.com/NickCis/drm_tool#commit=$_commit")
sha256sums=("SKIP")

pkgver() {
  cd $pkgname
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm 755 drm_tool "$pkgdir"/usr/bin/drm_tool
}

# vim: ts=2:sw=2:et
