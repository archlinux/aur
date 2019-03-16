# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-dbus-config
_pkgname=selinux-dbus
pkgver=2.9
pkgrel=1
pkgdesc="DBus service which allows managing SELinux configuration"
groups=('selinux')
arch=('any')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
depends=('python' 'selinux-python')
conflicts=('policycoreutils<2.7')
source=("https://github.com/SELinuxProject/selinux/releases/download/20190315/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ac54cecdea6a88b4a818981ac82654d054a3c5232b1b282ebf7418c3e350cc7a')

build() {
  cd "${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
