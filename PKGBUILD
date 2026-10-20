# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-refpolicy-src
_origname=refpolicy
pkgver=20260922
pkgrel=1
pkgdesc="SELinux reference policy sources"
arch=('any')
url="https://github.com/SELinuxProject/refpolicy/wiki"
license=('GPL')
groups=('selinux' 'selinux-policies')
optdepends=('linux-hardened: Linux kernel with SELinux support')
makedepends=('python' 'checkpolicy>=3.0' 'policycoreutils>=3.0'
             'libsepol>=3.0' 'libsemanage>=3.0')
source=("https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_${pkgver}/${_origname}-2.${pkgver}.tar.bz2")
sha256sums=('9dc3a67226219299cd036b3fe3a5148d08af0fc8af784c7f3e490957264b26b6')

package() {
  cd "${srcdir}/${_origname}"
  make DESTDIR="${pkgdir}" install-src
}
