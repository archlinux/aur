# Maintainer: liberodark

pkgname=odrive-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Google Drive GUI"
arch=('x86_64')
url="https://github.com/liberodark/ODrive"
license=('GPL')
depends=('xdg-utils')
source_x86_64=("https://github.com/liberodark/ODrive/releases/download/v${pkgver}/odrive_${pkgver}_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('015c99c44f48b513980a9a55f407a0b0bcc619a6747dc329e410777339a0135785bfcc8480e732cfaf58a53a5f7229109559e723fac575a45381c5285f300e06'
         'e852e6ee2714900b2b484dbe3f9bb69e72895391fed5e6776142c48daaf7e75a8a12908812894e5695277447bd2704cad93cd4f2ed0940ef45008e93b8823dd1')
sha512sums_x86_64=('e3681d0af651dfaaf5d4a76a38cf50b6c71b5930e97edd2ac7a6fbff04b1a99a4b2f3c8612ea8ab6229b49e0dd2df8f5d02015d1aa1cd8def1683afddf1e903d')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

