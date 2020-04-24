# Maintainer: trya <tryagainprod@gmail.com>

pkgname=mach64drm
pkgver=5.6
pkgrel=1
pkgdesc="Mach64 DRM module"
arch=('i686' 'x86_64')
url="http://dri.freedesktop.org/wiki/DRM"
license=('GPL')
depends=('linux')
makedepends=('linux-headers')
optdepends=('mach64-dri: Mesa DRI drivers for Mach64'
            'xf86-video-mach64: X.Org Mach64 video driver')
source=(https://github.com/trya/mach64-drm/archive/v$pkgver.tar.gz)
sha256sums=('11aa8d18fe698a3bc356fb4a278ecb85cc66c36e26366aab104af67288b10415')
install="mach64drm.install"

build() {
  cd "$srcdir/mach64-$pkgver"
  make
}

package() {
  install -Dm644 "$srcdir/mach64-$pkgver/mach64.ko" \
    "$pkgdir/usr/lib/modules/`uname -r`/kernel/drivers/gpu/drm/mach64/mach64.ko"
}
