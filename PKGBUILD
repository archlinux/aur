# Maintainer: trya <tryagainprod@gmail.com>

pkgname=mach64drm
pkgver=20180107
pkgrel=1
pkgdesc="Mach64 DRM module"
arch=('i686' 'x86_64')
url="http://dri.freedesktop.org/wiki/DRM"
license=('GPL')
depends=('linux')
makedepends=('linux-headers')
optdepends=('mach64-dri: Mesa DRI drivers for Mach64'
            'xf86-video-mach64: X.Org Mach64 video driver')
source=(http://trya.alwaysdata.net/linux/mach64-$pkgver.tar.gz)
sha256sums=('e53bed9d295d250a8f6632a353710939ee6998190df64b8ac3573573ee086bad')
install="mach64drm.install"

build() {
  cd "$srcdir/mach64-$pkgver"
  make
}

package() {
  install -Dm644 "$srcdir/mach64-$pkgver/mach64.ko" \
    "$pkgdir/usr/lib/modules/`uname -r`/kernel/drivers/gpu/drm/mach64/mach64.ko"
}
