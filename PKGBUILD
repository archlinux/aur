# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Noel Kuntze <noel@familie-kuntze.de>

pkgname=pcs
pkgver=0.9.164
pkgrel=1
pkgdesc='pacemaker corosync shell utility for cluster configuration'
arch=('any')
url='http://clusterlabs.org/'
license=('GPL2')
depends=('python')
makedepends=('wget' 'python-setuptools')
source=("https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f5c26e470ace01e961f50ec6883d78e3556a572c274b7093005d496baed4fc33d38409169b06b67722b2fed32d5fd42cf8eb2b6832fe8e55027bf12a37dd5dc4')

#build() {
#  cd $pkgname-$pkgver
#  make -C pcsd BUILD_GEMS=true build_gems
#}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

# vim: set sw=2 et:
