# Contributor: Dave Reisner <dreisner@archlinux.org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=u9fs-hg
pkgver=r11.87c2a420d556
pkgrel=1
pkgdesc="Serve 9P from Unix."
arch=('i686' 'x86_64')
url="http://code.google.com/p/u9fs/"
license=('GPL')
makedepends=('mercurial')
provides=('u9fs')
conflicts=('u9fs')
source=("$pkgname::hg+https://bitbucket.org/plan9-from-bell-labs/u9fs")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 u9fs "$pkgdir/usr/bin/u9fs"
  install -Dm644 u9fs.man "$pkgdir/usr/share/man/man4/u9fs.4"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

