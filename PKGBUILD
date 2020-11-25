# Maintainer: Radoslav Georgiev <rgeorgiev583@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: aksr <aksr at t-com dot me>
pkgname=u9fs-git
pkgver=r37.9639caf
pkgrel=1
pkgdesc="Serve 9P from Unix."
arch=('i686' 'x86_64')
url="https://bitbucket.org/plan9-from-bell-labs/u9fs/"
license=('custom')
makedepends=('git')
provides=('u9fs')
conflicts=('u9fs')
replaces=('u9fs-hg')
source=("$pkgname::git+https://bitbucket.org/plan9-from-bell-labs/u9fs")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
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

