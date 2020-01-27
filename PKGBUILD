# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=pathvisio
pkgver=3.3.0
pkgrel=1
pkgdesc='Pathway visualization tool'
arch=('any')
url='http://www.pathvisio.org/'
license=('LGPL')
makedepends=('java-environment' 'ant')
depends=('java-runtime')
replaces=('pathvisio-devel')
source=("https://github.com/PathVisio/pathvisio/releases/download/v$pkgver/pathvisio_src-$pkgver.zip"
        "pathvisio.sh")
sha256sums=('0e7f030f4c92bec8796ca39b9cdcffebc33603d49bb585e45fe8376035416d02'
            '308fded5cf888642d054da46acbb800d2d63bc38e539086c327a6d13bc9a8846')

build() {
  cd "$srcdir"/pathvisio-$pkgver
  ant
}

package() {
  cd "$srcdir"/pathvisio-$pkgver
  install -Dm755 ../pathvisio.sh "$pkgdir/usr/bin/pathvisio"
  install -Dm755 pathvisio.jar "$pkgdir/usr/share/java/pathvisio.jar"
}
