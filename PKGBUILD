# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-refpolicy-src
_origname=refpolicy
pkgver=20170805
pkgrel=1
pkgdesc="SELinux reference policy sources"
arch=('any')
url="https://github.com/TresysTechnology/refpolicy/wiki"
license=('GPL')
groups=('selinux' 'selinux-policies')
optdepends=('linux-hardened: Linux kernel with SELinux support'
            'linux-selinux: Linux kernel with SELinux support')
makedepends=('python' 'checkpolicy>=2.6' 'policycoreutils>=2.6'
             'libsepol>=2.7' 'libsemanage>=2.6')
source=("https://raw.githubusercontent.com/wiki/TresysTechnology/${_origname}/files/${_origname}-2.${pkgver}.tar.bz2")
sha256sums=('045709f5e44199f402149b31c6aab9666bdb1540a5c5ed0312a46c90dedfa52d')

package() {
  cd "${srcdir}/${_origname}"
  make DESTDIR="${pkgdir}" install-src
}
