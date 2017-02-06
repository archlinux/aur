# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-refpolicy-src
_origname=refpolicy
pkgver=20170204
pkgrel=1
pkgdesc="SELinux reference policy sources"
arch=('any')
url="https://github.com/TresysTechnology/refpolicy/wiki"
license=('GPL')
groups=('selinux' 'selinux-policies')
depends=('linux-selinux')
makedepends=('checkpolicy>=2.1.8' 'policycoreutils>=2.1.10'
             'libsepol>=2.1.4' 'libsemanage>=2.0.29')
source=("https://raw.githubusercontent.com/wiki/TresysTechnology/${_origname}/files/${_origname}-2.${pkgver}.tar.bz2")
sha256sums=('5e4daee61d89dfdc8c7bf369f81c99845931e337916dc6401e301c5de57ea336')

package() {
  cd "${srcdir}/${_origname}"
  make DESTDIR="${pkgdir}" install-src
}
