# Maintainer: Alexander <chayka43@inbox.ru>
pkgname=ttac
pkgver=0.2.0
pkgrel=1
pkgdesc="Аналог cat и других UNIX утилит."
arch=('x86_64')
url="https://github.com/CHAYKA43/Ttac"
license=('MIT')
depends=('xclip')
makedepends=('dub' 'git' 'dmd')
provides=('ttac')
conflicts=('ttac')
replaces=('ttac')
source=("$pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  dub build --compiler=dmd --build=release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ttac "$pkgdir/usr/bin/ttac"
}
