# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>
pkgname=scalarr
pkgver=1.0.0
pkgrel=1
pkgdesc="A command-line interface for Sonarr"
arch=('any')
url="https://github.com/nichobi/scalarr"
license=('GPL')
depends=('java-runtime')
makedepends=('sbt')
source=("https://github.com/nichobi/$pkgname/archive/v$pkgver.tar.gz" scalarr)
md5sums=('7338ae0c81599bae88bcc132230e149b' 'ae65ce3a9bfbf4a164132b124e44bc3f')

build() {
	cd "$pkgname-$pkgver"
	sbt assembly
}
package() {
	cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/java/scalarr/
  cp target/scala-2.13/$pkgname-assembly-$pkgver.jar $pkgdir/usr/share/java/scalarr/scalarr.jar
  mkdir -p $pkgdir/usr/bin/
  cp ../scalarr $pkgdir/usr/bin/scalarr
  chmod +x $pkgdir/usr/bin/scalarr
}
