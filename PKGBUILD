# Maintainer: Otto Sabart <aur@seberm.com>
# Maintainer: arjan5 <aur@anymore.nl>

# Ref.: https://github.com/QubesOS/qubes-app-linux-usb-proxy/blob/master/archlinux/PKGBUILD

pkgname=qubes-usb-proxy
pkgver=1.0.24
pkgrel=1
pkgdesc="The Qubes service for proxying USB devices"
arch=("x86_64")
url="https://qubes-os.org"
license=('GPL')
depends=('sh' 'qubes-vm-core' 'usbutils')
makedepends=(pkg-config make gcc)

source=(https://github.com/QubesOS/qubes-app-linux-usb-proxy/archive/v${pkgver}.tar.gz)
sha512sums=('109885b4a44b2834318fe1a33abe39367642166202aad5d2c1170cd8b7ad056d89b329ba670523f244f6e3291404661c565be8015b38b8be5e493c91370e9d61')

_srcname=qubes-app-linux-usb-proxy-${pkgver}

package() {
    cd "$srcdir/$_srcname/"
    make install-vm DESTDIR=$pkgdir
}
