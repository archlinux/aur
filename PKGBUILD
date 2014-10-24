# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=selinux-refpolicy-src
_origname=refpolicy
pkgver=20130424
pkgrel=1
pkgdesc="SELinux reference policy sources"
arch=('any')
url="http://oss.tresys.com/projects/refpolicy"
license=('GPL')
groups=('selinux' 'selinux-policies')
depends=('linux-selinux')
makedepends=('selinux-usr-checkpolicy>=2.1.8' 'selinux-usr-policycoreutils>=2.1.10'
             'selinux-usr-libsepol>=2.1.4' 'selinux-usr-libsemanage>=2.0.29' 
             'pyxml')
source=(http://oss.tresys.com/files/${_origname}/${_origname}-2.${pkgver}.tar.bz2)
sha256sums=('6039ba854f244a39dc727cc7db25632f7b933bb271c803772d754d4354f5aef4')

package() {
  cd "${srcdir}/${_origname}"
  sed -i -e "s/python/python2/" Makefile
  make DESTDIR="${pkgdir}" install-src
}
