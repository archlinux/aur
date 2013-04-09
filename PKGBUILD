# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Geoffrey Teale <g.teale@elsevier.com>
pkgname=shunit2  
pkgver=2.1.6
pkgrel=7
pkgdesc="xUnit based unit testing for Unix shell scripts"
url="http://code.google.com/p/shunit2/"
arch=('any')
license=('LGPL2.1')
depends=('bash')
source=(http://shunit2.googlecode.com/files/$pkgname-$pkgver.tgz)
md5sums=('4af955ef88c454808754939c83afa22b')

check() { 
  cd ${srcdir}/$pkgname-$pkgver
  cd src && ./shunit2_test.sh
}

package() { 
  cd ${srcdir}/$pkgname-$pkgver
  install -d ${pkgdir}/usr/share/doc/shunit2/examples
  install -t ${pkgdir}/usr/share/doc/shunit2 ./doc/*
  install -t ${pkgdir}/usr/share/doc/shunit2/examples ./examples/*

  install -D src/shunit2 $pkgdir/usr/bin/shunit2
}
