# Maintainer: Patrick Ziegler p.ziegler96 at gmail dot comd
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Geoffrey Teale <g.teale@elsevier.com>
pkgname=shunit2
pkgver=2.1.8
pkgrel=1
pkgdesc="xUnit based unit testing for Unix shell scripts"
url="https://github.com/kward/shunit2/"
arch=('any')
license=('Apache')
depends=('bash')
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('b2fed28ba7282e4878640395284e43f08a029a6c27632df73267c8043c71b60c')

check() {
  cd ${srcdir}/$pkgname-$pkgver
  SHELL=/usr/bin/bash bash ./test_runner
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  install -d ${pkgdir}/usr/share/doc/shunit2/examples
  install -t ${pkgdir}/usr/share/doc/shunit2 ./doc/*
  install -t ${pkgdir}/usr/share/doc/shunit2/examples ./examples/*

  install -D shunit2 $pkgdir/usr/bin/shunit2
}
