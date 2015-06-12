# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=pathvisio
pkgver=3.1.2
_pkgver=r3950
pkgrel=1
pkgdesc='Pathway visualization tool'
arch=('any')
url=('http://www.pathvisio.org/')
license=('LGPL')
makedepends=('java-environment' 'apache-ant')
depends=('java-runtime')
replaces=('pathvisio-devel')
source=("http://www.pathvisio.org/data/releases/$pkgver/pathvisio_src-$pkgver-$_pkgver.tar.gz" pathvisio.sh)
md5sums=('d60e854a8a2cab6c04fc39c726b0fefb'
         '68c218612a2f09c8e378c013f8d60117')

build() {
  cd "$srcdir"/pathvisio-$pkgver
  ant
}

package() {
  cd "$srcdir"/pathvisio-$pkgver
  install -Dm755 ../pathvisio.sh "$pkgdir/usr/bin/pathvisio"
  install -Dm755 pathvisio.jar "$pkgdir/usr/share/java/pathvisio.jar"
}

