# Maintainer: nafets227 <nafets227@users.noreply.github.com>
pkgname=vdr-softhddevice-drm-gles
pkgver=r1128.897b4ff
pkgrel=1
_vdrapi=9
pkgdesc="VDR output plugin for software HD based on DRM interface"
arch=('aarch64')
license=('AGPL3')
depends=('ffmpeg' "vdr-api=${_vdrapi}" 'alsa-lib' 'glm')  # mesa-utils glu libva-mesa-driver
source=(
	"${pkgname}::git+https://github.com/rellla/vdr-plugin-softhddevice-drm-gles.git"
	)
sha256sums=(
	'SKIP'
	)

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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

