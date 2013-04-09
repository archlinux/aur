# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Geoffrey Teale <g.teale@elsevier.com>
pkgname=shunit2  
pkgver=2.1.6
pkgrel=6
pkgdesc="xUnit based unit testing for Unix shell scripts"
url="http://code.google.com/p/shunit2/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=shunit2.install
source=(http://shunit2.googlecode.com/files/$pkgname-$pkgver.tgz
	shunit2.install)
md5sums=('4af955ef88c454808754939c83afa22b'
         'fb208a1eb601e1be84114df1fa2268db')
package() { 
  cd ${srcdir}/$pkgname-$pkgver
  install -d ${pkgdir}/usr/share/shunit2/bin
  install -d ${pkgdir}/usr/share/shunit2/doc
  install -d ${pkgdir}/usr/share/shunit2/examples
  install -d ${pkgdir}/usr/share/shunit2/lib
  install -d ${pkgdir}/usr/share/shunit2/src
  install -t ${pkgdir}/usr/share/shunit2/bin ./bin/*
  install -t ${pkgdir}/usr/share/shunit2/doc ./doc/*
  install -t ${pkgdir}/usr/share/shunit2/examples ./examples/*
  install -t ${pkgdir}/usr/share/shunit2/lib ./lib/*
  install -t ${pkgdir}/usr/share/shunit2/src ./src/*
  cd ${pkgdir}/usr/share/shunit2/bin
  perl -p -i -e "s/BASE_DIR.*\\\$0.*/BASE_DIR=\"\/usr\/share\/shunit2\"/g" gen_test_results.sh 
}
