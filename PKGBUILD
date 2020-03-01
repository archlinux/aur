# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-refpolicy-src
_origname=refpolicy
pkgver=20200229
pkgrel=1
pkgdesc="SELinux reference policy sources"
arch=('any')
url="https://github.com/SELinuxProject/refpolicy/wiki"
license=('GPL')
groups=('selinux' 'selinux-policies')
optdepends=('linux-hardened: Linux kernel with SELinux support'
            'linux-selinux: Linux kernel with SELinux support')
makedepends=('python' 'checkpolicy>=2.8' 'policycoreutils>=2.8'
             'libsepol>=2.8' 'libsemanage>=2.8')
source=("https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_${pkgver}/${_origname}-2.${pkgver}.tar.bz2")
sha256sums=('dec854512ed00cd057408f330c2cea4de7a4405f7a147458f59c994bf578e4b0')

package() {
  cd "${srcdir}/${_origname}"
  make DESTDIR="${pkgdir}" install-src
}
