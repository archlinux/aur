# Maintainer: bilabila <bilabila@qq.com>
_pkgname=mygestures
pkgname=$_pkgname
pkgver=2.0
pkgrel=1
pkgdesc='Mouse Gestures for Linux'
arch=(x86_64)
url=https://github.com/deters/mygestures
provides=($_pkgname)
conflicts=($_pkgname)
license=(custom)
depends=(libtool libx11 libxrender libxtst libxml2)
makedepends=(autoconf pkgconf make)
source=($_pkgname-$pkgver::https://github.com/deters/mygestures/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=(eda75e2429b671c5ff15435b3ce3ae78e95069b17f6d2ea0d279c7c100a72e4b6dc4f452f9c003b432266d8d1047cd6ae47dc544e2f1b4f86f02fabe8c70e6dd)
_src=$_pkgname-$pkgver
build() {
  cd $_src
  sh autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc/$_pkgname
  make
}
package() {
  install -Dm644 $_src/mygestures.xml "$pkgdir"/etc/$_pkgname/mygestures.xml
  install -Dm755 $_src/src/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
