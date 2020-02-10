# Maintainer: Patrick Ziegler p.ziegler96 at gmail dot comd
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Geoffrey Teale <g.teale@elsevier.com>
pkgname=shunit2
pkgver=2.1.7
pkgrel=1
pkgdesc="xUnit based unit testing for Unix shell scripts"
url="https://github.com/kward/shunit2/"
arch=('any')
license=('Apache')
depends=('bash')
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('41a103aa984bfdeea3fec426edb0b3dda19153a5ce448d4b4bbe52a85c4d7fee')

check() { 
  cd ${srcdir}/$pkgname-$pkgver
  ./test_runner
}

package() { 
  cd ${srcdir}/$pkgname-$pkgver
  install -d ${pkgdir}/usr/share/doc/shunit2/examples
  install -t ${pkgdir}/usr/share/doc/shunit2 ./doc/*
  install -t ${pkgdir}/usr/share/doc/shunit2/examples ./examples/*

  install -D shunit2 $pkgdir/usr/bin/shunit2
}
