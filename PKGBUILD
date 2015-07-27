# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=tinyterm-git
_pkgname=tinyterm
pkgver=0.3.1.g633d60e
pkgrel=1
pkgdesc="Very lightweight terminal emulator based on VTE (fork of tinyterm-svn package)"
arch=('i686' 'x86_64')
url="https://github.com/lahwaacz/tinyterm"
license=('MIT')
depends=('vte')
makedepends=('git')
source=('git://github.com/lahwaacz/tinyterm.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's|^v||;s|-|.|g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
