# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=grpn
pkgver=1.3.4
pkgrel=1
pkgdesc='A graphical reverse polish notation (RPN) calculator'
arch=('i686' 'x86_64')
url='http://www.getreu.net/'
license=('GPL')
depends=('gtk2')
source=(http://www.getreu.net/public/downloads/software/$pkgname/$pkgname-$pkgver/${pkgname}_${pkgver}-1.tar.gz \
        $pkgname.desktop)
sha256sums=('e26c9c4648c11d35d3a0ba8bb7855b016e2559fa291036eb2dac0a9d4b2caa6f'
            '2c0f7685e7423e14f93c38fca951b8497009da4705f4b629f01c4048b32697ab')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  install -D -m755 $pkgname ${pkgdir}/usr/bin/$pkgname
  install -D -m644 $pkgname.1 ${pkgdir}/usr/share/man/man1/$pkgname.1

#.desktop file + icon
  install -D -m644 ${srcdir}/$pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/icon.png \
    ${pkgdir}/usr/share/pixmaps/$pkgname.png
}
