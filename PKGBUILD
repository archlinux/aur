# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-refpolicy-src
_origname=refpolicy
pkgver=20140311
pkgrel=1
pkgdesc="SELinux reference policy sources"
arch=('any')
url="http://oss.tresys.com/projects/refpolicy"
license=('GPL')
groups=('selinux' 'selinux-policies')
depends=('linux-selinux')
makedepends=('checkpolicy>=2.1.8' 'policycoreutils>=2.1.10'
             'libsepol>=2.1.4' 'libsemanage>=2.0.29')
source=(https://raw.githubusercontent.com/wiki/TresysTechnology/${_origname}/files/${_origname}-2.${pkgver}.tar.bz2)
sha256sums=('f69437db95548c78a5dec44c236397146b144153149009ea554d2e536e5436f7')

package() {
  cd "${srcdir}/${_origname}"
  make DESTDIR="${pkgdir}" install-src
}
