# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=qtwebkit-plugins-git
pkgver=15.4e2e040
pkgrel=2
pkgdesc='Spell checking plugin using Hunspell and HTML5 Notifications plugin for QtWebKit.'
url='https://github.com/QupZilla/qtwebkit-plugins'
arch=('i686' 'x86_64')
license=('GPL3+')
depends=('qt5-base' 'qt5-webkit' 'hunspell')
makedepends=('git')
source=('git+https://github.com/QupZilla/qtwebkit-plugins.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/qtwebkit-plugins"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/qtwebkit-plugins"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/qtwebkit-plugins"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
