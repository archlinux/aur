# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>
pkgname=emacs-ess
pkgver=17.11
pkgrel=2
pkgdesc="Emacs Speaks Statistics: A Universal Interface for Statistical Analysis"
url="http://ess.r-project.org/"
arch=('any')
license=('GPL')
depends=('emacs' 'r')
makedepends=('wget')
replaces=('ess')
provides=('ess')
install=ess.install
source=("http://ess.r-project.org/downloads/ess/ess-${pkgver}.tgz")
md5sums=('26cbbd358334ab6d480a5dcf3b3665dd')

build() {
  cd ess-$pkgver
  make prefix=/usr
}
package() {
  cd ess-$pkgver
  make DESTDIR="$pkgdir"/usr INFODIR="$pkgdir"/usr/share/info/ install
}
