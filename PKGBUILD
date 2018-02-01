# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: totoloco <totoloco at gmx>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tabbed-vain
pkgver=0.6
pkgrel=1
pkgdesc="Suckless tabbed modified to suit the author's needs"
arch=('i686' 'x86_64')
url='https://github.com/vain/tabbed-vain.git'
license=('custom:MIT/X')
depends=('libxft')
makedepends=('git')
conflicts=('tabbed')
provides=('tabbed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vain/$pkgname/archive/$pkgver.tar.gz"
        'config.h')
md5sums=('654bab23528cca963dd59612ef11cdd3'
         '061c739dc784bf74e92bd5b7a1100623')

build() {
  cd $pkgname-$pkgver
  cp "${srcdir}"/config.h config.h
  make
}

package() {
  cd $pkgname-$pkgver

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
