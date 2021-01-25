# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=pikopixel
pkgver=1.0.b10
pkgrel=1
pkgdesc="A free, open-source application for drawing & editing pixel-art images"
arch=('x86_64')
url="http://twilightedge.com/mac/pikopixel/"
license=('AGPL3')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gnustep-make' 'gcc-objc')
source=("http://twilightedge.com/downloads/PikoPixel.Sources.${pkgver%.*}-${pkgver##*.}.tar.gz")
sha256sums=('e754a89b4a3de5e034c96468d3bc37a0909ea7c06905546ee85658a5dfb547ac')

build() {
  cd PikoPixel.Sources.${pkgver%.*}-${pkgver##*.}/PikoPixel

  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make
}

package() {
  cd PikoPixel.Sources.${pkgver%.*}-${pkgver##*.}/PikoPixel

  make DESTDIR="$pkgdir" install

  # .desktop entry
  install -Dm0644 PikoPixel.app/Resources/PikoPixel.desktop "$pkgdir"/usr/share/applications/PikoPixel.desktop
}
