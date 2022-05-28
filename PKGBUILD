# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-dbus-config
_pkgname=selinux-dbus
pkgver=3.4
pkgrel=1
pkgdesc="DBus service which allows managing SELinux configuration"
groups=('selinux')
arch=('any')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
depends=('python' 'selinux-python')
conflicts=('policycoreutils<2.7')
validpgpkeys=('E853C1848B0185CF42864DF363A8AD4B982C4373')  # Petr Lautrbach <plautrba@redhat.com>
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('b8282554199b31f5cd31b3fa25fcf4dbc8d4cb93026dffe91e61a97c4580e58b'
            'SKIP')

build() {
  cd "${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
