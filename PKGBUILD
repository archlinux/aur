# Maintainer: Otto Sabart <aur@seberm.com>
# Maintainer: arjan5 <aur@anymore.nl>

# Ref.: https://github.com/QubesOS/qubes-app-linux-usb-proxy/blob/master/archlinux/PKGBUILD

pkgname=qubes-usb-proxy
_gitname=${pkgname%-git*}
pkgver=1.0.24
pkgrel=1
pkgdesc="The Qubes service for proxying USB devices"
arch=("x86_64")
url="https://www.qubes-os.org/doc/usb-devices/"
license=('GPL')
depends=('sh' 'qubes-vm-core' 'usbutils')
makedepends=('pkg-config' 'make' 'gcc')
validpgpkeys=('0AF64C3B1F1214B38C8C57861FA2DBE674387CC3'  # Otto Sabart
              '0064428F455451B3EBE78A7F063938BA42CFA724'  # Marek Marczykowski-Górecki
              '427F11FD0FAA4B080123F01CDDFA1A3E36879494'  # Qubes Master Signing Key
)

source=("$_gitname::git+https://github.com/QubesOS/qubes-app-linux-usb-proxy.git?signed#tag=v${pkgver}")
sha512sums=('SKIP')

package() {
    cd "${srcdir}/${_gitname}/"
    make install-vm DESTDIR="$pkgdir"
}
