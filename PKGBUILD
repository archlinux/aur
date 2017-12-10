# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>
 
pkgname=jmeld-git
pkgver=3.2
pkgrel=1
pkgdesc="Visual diff and merge tool"
arch=('any')
url="https://github.com/albfan/jmeld"
license=('LGPL')
provides=('jmeld-git')
depends=('java-runtime')
makedepends=('maven')
source=("git+https://github.com/albfan/jmeld")
md5sums=('SKIP')
 
build() {
	cd "$srcdir"/$pkgname
	mvn -P linux-dist package
}
 
package() {
	cd "$srcdir"/$pkgname
   unzip target/$pkgname-$pkgver-bin.zip
   mv $pkgname-$pkgver/* $pkgdir
}
