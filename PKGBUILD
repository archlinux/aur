# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-refpolicy-src
_origname=refpolicy
pkgver=20141203
pkgrel=1
pkgdesc="SELinux reference policy sources"
arch=('any')
url="https://github.com/TresysTechnology/refpolicy/wiki"
license=('GPL')
groups=('selinux' 'selinux-policies')
depends=('linux-selinux')
makedepends=('checkpolicy>=2.1.8' 'policycoreutils>=2.1.10'
             'libsepol>=2.1.4' 'libsemanage>=2.0.29')
source=(https://raw.githubusercontent.com/wiki/TresysTechnology/${_origname}/files/${_origname}-2.${pkgver}.tar.bz2)
sha256sums=('f438209c430d8a2d4ddcbe4bdd3edb46f6af7dc4913637af0b73c635e40c1522')

package() {
  cd "${srcdir}/${_origname}"
  make DESTDIR="${pkgdir}" install-src
}
