# Maintainer: trya <tryagainprod@gmail.com>

pkgname=mach64drm
pkgver=6.0
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
sha256sums=('8dce1a4574ddf55849f3bc64ebaf9ee32dd39c6559e3cb64b3818d63a45b77c6')
install="mach64drm.install"

build() {
  cd "$srcdir/mach64-drm-$pkgver"
  make
}

package() {
  install -Dm644 "$srcdir/mach64-drm-$pkgver/mach64.ko" \
    "$pkgdir/usr/lib/modules/`uname -r`/kernel/drivers/gpu/drm/mach64/mach64.ko"
}
