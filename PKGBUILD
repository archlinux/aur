# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Geoffrey Teale <g.teale@elsevier.com>
pkgname=shunit2  
pkgver=2.1.6
pkgrel=7
pkgdesc="xUnit based unit testing for Unix shell scripts"
url="http://code.google.com/p/shunit2/"
arch=('any')
license=('LGPL2.1')
source=(http://shunit2.googlecode.com/files/$pkgname-$pkgver.tgz)
md5sums=('4af955ef88c454808754939c83afa22b')

build() { 
  cd ${srcdir}/$pkgname-$pkgver
  sed -i 's|BASE_DIR=.*|BASE_DIR="/usr/share/shunit2"|' bin/gen_test_results.sh 
}

package() { 
  cd ${srcdir}/$pkgname-$pkgver
  install -d ${pkgdir}/usr/share/shunit2/bin
  install -t ${pkgdir}/usr/share/shunit2/bin ./bin/*
  install -d ${pkgdir}/usr/share/shunit2/doc
  install -t ${pkgdir}/usr/share/shunit2/doc ./doc/*
  install -d ${pkgdir}/usr/share/shunit2/examples
  install -t ${pkgdir}/usr/share/shunit2/examples ./examples/*
  install -d ${pkgdir}/usr/share/shunit2/lib
  install -t ${pkgdir}/usr/share/shunit2/lib ./lib/*
  install -d ${pkgdir}/usr/share/shunit2/src
  install -t ${pkgdir}/usr/share/shunit2/src ./src/*

  install -d $pkgdir/usr/bin
  ln -s /usr/share/shunit2/bin/gen_test_results.sh \
	  $pkgdir/usr/bin/gen_test_results
}
