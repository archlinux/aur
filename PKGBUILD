# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Noel Kuntze <noel@familie-kuntze.de>

pkgname=pcs
pkgver=0.9.163
pkgrel=2
pkgdesc='pacemaker corosync shell utility for cluster configuration'
arch=('any')
url='http://clusterlabs.org/'
license=('GPL2')
depends=('python')
makedepends=('wget' 'python-setuptools')
source=("https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('6f3f5b4f7135f598c4448a6d36b366557c109550bbb672081da39c450a1c70a5e749729682c51aa485076a35db3ee5517b09606780463743e16eaf11ca777b7e')

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
