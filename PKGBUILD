# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Alex Griffin <griffin.aj@gmail.com>

pkgname=xss
pkgver=20120302
pkgrel=2

pkgdesc="A collection of small programs to compose your own screensaver or screenlocker"
arch=('i686' 'x86_64')
url="http://woozle.org/~neale/src/xss.html"
license=('GPL3')

depends=('libxss')
source=("http://woozle.org/neale/g.cgi/x11/xss/snapshot/xss-master.tar.gz")
sha256sums=('eace787462b6001cfa25c7859c8c034423cab5e4f616fa0cefa67916e2139415')

build() {
    cd "$pkgname-master"
    make
}

package() {
    cd "$pkgname-master"
    install -d "$pkgdir"/usr/bin/
    make BINDIR="$pkgdir"/usr/bin/ install
    install -m644 -D README "$pkgdir"/usr/share/doc/$pkgname/README
}
