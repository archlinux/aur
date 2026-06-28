# Maintainer: nafets227 <nafets227@users.noreply.github.com>
pkgname=vdr-softhddevice-drm-gles
pkgver=1.6.7
pkgrel=1
_vdrapi=13
pkgdesc="VDR output plugin for software HD based on DRM interface"
arch=('aarch64')
license=('AGPL3')
depends=('ffmpeg' "vdr-api=${_vdrapi}" 'alsa-lib' 'glm')  # mesa-utils glu libva-mesa-driver
source=(
	"${pkgname}::git+https://github.com/rellla/vdr-plugin-softhddevice-drm-gles.git#tag=$pkgver"
	)
sha256sums=(
	'SKIP'
	)

prepare() {
  cd "${srcdir}/${pkgbase}"
}

build() {
  cd "$srcdir/${pkgname}"
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir/" install
}

