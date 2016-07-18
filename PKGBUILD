# Maintainer: Roland Singer <roland.singer@desertbit.com>
# Upstream URL: https://github.com/openrazer/razer-drivers

# TODO: Checkout version

pkgname=razer-drivers-legacy-dkms
pkgver=0.1
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/openrazer/razer-drivers-legacy'
license=('GPLv2')
pkgdesc='Legacy linux kernel drivers to support various Razer Chroma devices.'
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/openrazer/razer-drivers-legacy.git")
md5sums=('SKIP')


package() {
    cd "$srcdir/razer-drivers-legacy"
    make -s -j1 DESTDIR="$pkgdir" UDEVDIR="/usr/lib/udev" install_dkms
}
