# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Noel Kuntze <noel@familie-kuntze.de>

pkgname=pcs
pkgver=0.9.162
pkgrel=2
pkgdesc='pacemaker corosync shell utility for cluster configuration'
arch=('any')
url='http://clusterlabs.org/'
license=('GPL2')
depends=('python' 'python-lxml' 'python-setuptools')
makedepends=('ruby-bundler' 'wget')
source=("https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('9616487e89882b2bf5007fb61adad4af88e164d003fd6401924fbff10c811ac1873607013226b4032ac4efaa5df5b36f5a39c8edafd572a7c2241855de39df18')

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
