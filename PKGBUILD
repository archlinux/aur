# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=emacs-ess
pkgver=18.10
pkgrel=3
pkgdesc="Emacs Speaks Statistics: A Universal Interface for Statistical Analysis"
url="http://ess.r-project.org/"
arch=('any')
license=('GPL')
depends=('emacs' 'r')
makedepends=('wget')
install=ess.install
source=("http://ess.r-project.org/downloads/ess/ess-${pkgver}.tgz"{,.sig})
sha256sums=('b9029347079af5487f0cab6ccfdbeb8da3ab2c8f3513a907666bbb9aa6893417'
            'SKIP')
validpgpkeys=('3808603281971CFF6949D38A1248E0A068E0DB0F') # Martin Maechler, ETHZ

build() {
  cd ess-$pkgver
  make prefix=/usr
}
package() {
  cd ess-$pkgver
  make DESTDIR="$pkgdir"/usr INFODIR="$pkgdir"/usr/share/info/ install
}
