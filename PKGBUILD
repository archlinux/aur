# Maintainer: An Nguyen (stk) <an@linux.com>
# Contrinutor: twa022 <twa022 at gmail dot com>
# Contrinutor: Tasos Latsas <tlatsas@gmx.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: damir <damir@archlinux.org>
# Development: http://closure.ath.cx/aur-dev

pkgname=bs
pkgver=2.11
pkgrel=2
pkgdesc="The classic game of Battleships against the computer. Ncurses."
arch=('i686' 'x86_64')
url="https://www.catb.org/~esr/bs/"
license=('GPL2')
depends=('ncurses' 'hicolor-icon-theme')
source=("http://www.catb.org/~esr/bs/bs-$pkgver.tar.gz"
        'Makefile_fix.patch')
sha256sums=('a53e22a94ed590a3e6720816f8b5750134fa004e7e738e0b123b77ac9668b026'
            '6e6d927f7ed8282674d6d031db68ac684e0b11b7c2c6461689f93c8c123f4a97')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -uNp2 -r- -i ../Makefile_fix.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
