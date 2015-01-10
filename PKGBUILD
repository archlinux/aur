# Contributor: Tim Buecher <timbuecher.dev@gmail.com>

pkgname=geany-astyle
pkgver=0.2.1
pkgrel=1
pkgdesc="Sourcecode formater/beautifier based on AStyle for Geany"
url="https://launchpad.net/geany-astyle"
arch=("i686" "x86_64")
license="GPL"
depends=('geany' 'astyle')
source=("https://github.com/downloads/m0jo/geany-astyle/$pkgname-$pkgver.tar.gz")
md5sums=('80aea4b1bba2189708fe068c0d3b6fc1')

build() {  
  tar -xvf $pkgname-$pkgver.tar.gz
  cd "$srcdir/$pkgname-$pkgver"
  gcc main.c -O2 -fPIC `pkg-config --cflags geany` -lastyle -shared `pkg-config --libs geany` -o "astyle_plugin.so"

  install -Dm755 astyle_plugin.so "$pkgdir/usr/lib/geany/astyle_plugin.so"
}
