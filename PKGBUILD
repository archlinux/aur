# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=selinux-sandbox
pkgver=2.7
pkgrel=1
pkgdesc="sandboxing tool for SELinux"
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
groups=('selinux')
depends=('libcap-ng' 'selinux-python')
conflicts=('policycoreutils<2.7')
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9490620380ab6d428a92869002a51ada0343ca35fa2a6905595745902a64c541')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" SBINDIR="${pkgdir}/usr/bin" install
}
