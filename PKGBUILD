# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-sandbox
pkgver=3.1
pkgrel=1
pkgdesc="sandboxing tool for SELinux"
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
groups=('selinux')
depends=('libcap-ng' 'selinux-python')
conflicts=('policycoreutils<2.7')
source=("https://github.com/SELinuxProject/selinux/releases/download/20200710/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c79b958e2f64570a59e60638fd13c15fd77c7c2bbac31c7ad4afb03718432b84')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" SBINDIR="/usr/bin" install
}
