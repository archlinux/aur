# Maintainer: twa022 <twa022 at gmail dot com>
# Contrinutor: Tasos Latsas <tlatsas@gmx.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: damir <damir@archlinux.org>
# Development: http://closure.ath.cx/aur-dev

pkgname=bs
pkgver=2.10
pkgrel=3
pkgdesc="The classic game of Battleships against the computer. Ncurses."
arch=('i686' 'x86_64')
url="https://www.catb.org/~esr/bs/"
license=('GPL2')
depends=('ncurses' 'hicolor-icon-theme')
source=("http://www.catb.org/~esr/bs/bs-$pkgver.tar.gz"
        'Makefile_fix.patch')
sha256sums=('1f8c1541fd13f481ff96df26d668658a7465da064801ae22ee584bd50f3a3107'
            'a09e386c70ecedf421d38907fbe91364f880c894408ba82051f55104852551c5')

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
