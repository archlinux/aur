# Maintainer : Andrew Sachen <webmaster@RealityRipple.com>

pkgname=secondfaqtor
_realname=SecondFaqtor
pkgdesc="Two-Factor Authenticator"
pkgver=1.2.2
pkgrel=2
arch=('any')
url="https://realityripple.com/Software/Applications/SecondFactor/For-Linux/"
changelog=ChangeLog
license=('Unlicense')
depends=('gambas3-gb-image>=3.15' 'gambas3-gb-image<=3.99.0' 'gambas3-gb-qt5>=3.15' 'gambas3-gb-qt5<=3.99.0' 'gambas3-gb-form>=3.15' 'gambas3-gb-form<=3.99.0' 'gambas3-gb-data>=3.15' 'gambas3-gb-data<=3.99.0' 'gambas3-gb-dbus>=3.15' 'gambas3-gb-dbus<=3.99.0' 'gambas3-gb-desktop>=3.15' 'gambas3-gb-desktop<=3.99.0' 'gambas3-gb-form-stock>=3.15' 'gambas3-gb-form-stock<=3.99.0' 'gambas3-gb-openssl>=3.15' 'gambas3-gb-openssl<=3.99.0' 'gambas3-gb-sdl2-audio>=3.15' 'gambas3-gb-sdl2-audio<=3.99.0' 'gambas3-gb-util-web>=3.15' 'gambas3-gb-util-web<=3.99.0' 'gambas3-gb-desktop-x11>=3.15' 'gambas3-gb-desktop-x11<3.99.0' 'zbar')
makedepends=('gambas3-dev-tools')
source=("https://realityripple.com/Software/Applications/SecondFactor/For-Linux/AUR/SecondFaqtor-$pkgver.tar.bz2"{,.sig} "https://realityripple.com/Software/Applications/SecondFactor/For-Linux/AUR/secondfaqtor.desktop"{,.sig})
sha256sums=('a1a78c22a3029483fc5ef9371152a2dd5a98b6ba66835774710c9d21731e3e90' '932c9fda27a4d1632d9681b4444195ab9d250f4a6528855ecf4d49d24edd6ed5' '70e6ce665d759ed7e6057ad3b5fbbd34413fdc50cbf7b813b4a80a83e8f3610d' '63d453bf8db7cfcbf1ec029a6ec57df9d35b66d35c908f206db6cf4f82514ac0')

validpgpkeys=('2BE391EF8EF9DB1E9BF546620B7C73813443493A') # Andrew Sachen

build() {
  cd ${srcdir}/SecondFaqtor

  gbc3 -e -a -g -t -x  && gba3
}

package() {
  cd ${srcdir}/SecondFaqtor

  install -d ${pkgdir}/usr/bin
  install -m755 SecondFaqtor.gambas ${pkgdir}/usr/bin/SecondFaqtor
  ln -s 'SecondFaqtor' "${pkgdir}"/usr/bin/'secondfaqtor'
  install -D icon.png \
    ${pkgdir}/usr/share/pixmaps/SecondFaqtor.png
  install -D ../secondfaqtor.desktop \
    ${pkgdir}/usr/share/applications/secondfaqtor.desktop
}
