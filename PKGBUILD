# Maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Alex Griffin <griffin.aj@gmail.com>
pkgname=xss
pkgver=20120302
# https://github.com/9wm/xss/issues/1
_commit=cfe9ab22e33a58ae86e4d88796260ce7c7398abc
pkgrel=4
pkgdesc="A collection of small programs to compose your own screensaver or screenlocker"
arch=('i686' 'x86_64')
url='https://github.com/9wm/xss'
license=('GPL3')
depends=('libxss')
makedepends=('git')
source=("git+https://github.com/9wm/xss.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cd "$pkgname-master"
    make
}

package() {
    cd "$pkgname-master"
    install -d "$pkgdir"/usr/bin/
    make BINDIR="$pkgdir"/usr/bin/ install
    install -m644 -D README.md "$pkgdir"/usr/share/doc/$pkgname/README
}
