# Maintainer: nafets227 <nafets227@users.noreply.github.com>
pkgname=vdr-softhddevice-drm-gles
pkgver=r852.85783c7
pkgrel=2
_vdrapi=2.6.6
pkgdesc="VDR output plugin for software HD based on DRM interface"
arch=('aarch64')
license=('AGPL3')
depends=('ffmpeg' "vdr-api=${_vdrapi}" 'alsa-lib' 'glm')  # mesa-utils glu libva-mesa-driver
source=("${pkgname}::git+https://github.com/rellla/vdr-plugin-softhddevice-drm-gles.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir/" install
}

