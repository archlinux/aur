# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=sepolgen
pkgver=1.2.3
pkgrel=1
pkgdesc="SELinux policy generator"
groups=('selinux')
arch=('any')
url='http://userspace.selinuxproject.org'
license=('GPL')
depends=('python2')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3ee1745257fa55301070219c77978c7c9eeb9aa595ce0b6b29c3baa4687d5cf0')

build() {
  cd "${pkgname}-${pkgver}"
  make PYTHON=python2
}

package(){
  cd "${pkgname}-${pkgver}"
  make PYTHON=python2 DESTDIR="${pkgdir}" install
  make PYTHON=python3 DESTDIR="${pkgdir}" install
}
