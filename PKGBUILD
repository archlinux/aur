# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-refpolicy-src
_origname=refpolicy
pkgver=20161023
_pkgver="${pkgver}-1"
pkgrel=1
pkgdesc="SELinux reference policy sources"
arch=('any')
url="https://github.com/TresysTechnology/refpolicy/wiki"
license=('GPL')
groups=('selinux' 'selinux-policies')
depends=('linux-selinux')
makedepends=('checkpolicy>=2.1.8' 'policycoreutils>=2.1.10'
             'libsepol>=2.1.4' 'libsemanage>=2.0.29')
source=(https://raw.githubusercontent.com/wiki/TresysTechnology/${_origname}/files/${_origname}-2.${_pkgver}.tar.bz2)
sha256sums=('f056de551c17bbbd2775dfa63a94434538548c90ed1e0f0b6c2be6bf9b123e4f')

package() {
  cd "${srcdir}/${_origname}"
  make DESTDIR="${pkgdir}" install-src
}
