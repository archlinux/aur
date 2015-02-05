# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=sepolgen
pkgver=1.2.2
pkgrel=1
pkgdesc="SELinux policy generator"
groups=('selinux')
arch=('any')
url='http://userspace.selinuxproject.org'
license=('GPL')
depends=('python2')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20150202/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bebda8eeb2d386d26823d724ea320508a02b50828d44aff47c3f907cf54c2324')

build() {
  cd "${pkgname}-${pkgver}"
  make PYTHON=python2
}

package(){
  cd "${pkgname}-${pkgver}"
  make PYTHON=python2 DESTDIR="${pkgdir}" install
}
