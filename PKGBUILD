# Maintainer: cdude
# Contributor: sekret

_pkgname=zihap
pkgname=zihap-git
pkgver=baab1776aafbe43b86c599ffc816392c154bd678
pkgrel=0
pkgdesc="A meta chat app that base on suckless sofware (surf , tabbled)"
arch=('i686' 'x86_64')
url="https://gitlab.com/exkc/zihap/"
license=('custom:M/IT/X')
depends=('webkit2gtk' 'gcr' 'xorg-xprop' 'libxft' 'tomlc99-git')
makedepends=('git')
#optdepends=('dmenu : search page and select an already existing tab' )
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.com/exkc/zihap")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
cat .git/refs/heads/main
}

build() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

