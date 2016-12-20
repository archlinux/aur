# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=pathvisio
pkgver=3.2.4
pkgrel=1
pkgdesc='Pathway visualization tool'
arch=('any')
url='http://www.pathvisio.org/'
license=('LGPL')
makedepends=('java-environment' 'apache-ant')
depends=('java-runtime')
replaces=('pathvisio-devel')
source=("http://www.pathvisio.org/data/releases/$pkgver/pathvisio_src-$pkgver.tar.gz"
        "pathvisio.sh")
md5sums=('819262dee27b84ddf3edd5b69bda9d5c'
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
