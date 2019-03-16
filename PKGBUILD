# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=semodule-utils
pkgver=2.9
pkgrel=1
pkgdesc="SELinux module tools"
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
groups=('selinux')
depends=('libsepol>=2.7')
conflicts=('policycoreutils<2.7')
source=("https://github.com/SELinuxProject/selinux/releases/download/20190315/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8083679ee634570f6e9a18632f2c2862b9134fa308b689b2e1952a369ae5d907')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
