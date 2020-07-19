# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-dbus-config
_pkgname=selinux-dbus
pkgver=3.1
pkgrel=1
pkgdesc="DBus service which allows managing SELinux configuration"
groups=('selinux')
arch=('any')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
depends=('python' 'selinux-python')
conflicts=('policycoreutils<2.7')
source=("https://github.com/SELinuxProject/selinux/releases/download/20200710/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('61f936d200ff8302c513883c67bb7c4c496513e78122954cbd33db62086a06f2')

build() {
  cd "${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
