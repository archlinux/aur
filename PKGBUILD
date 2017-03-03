# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=flips
pkgver=1.31
pkgrel=2
pkgdesc="Floating IPS - Applies and creates IPS and BPS patches"
depends=('gtk3')
makedepends=('unzip')
arch=('i686' 'x86_64')
url="http://www.smwcentral.net/?p=section&a=details&id=11474"
license=('GPL')
source=('http://dl.smwcentral.net/11474/floating.zip'
        'flips.desktop'
        'flips.png')
sha256sums=('1e28e9217084b81ba53d51c4b5d29179a6c1f9d2e0f900c08c55df1666298c80'
            '73ae77df90611cc73161b1a7b3ad39e701e31fc48a573679a0144bdec041cc65'
            '9b7c04cb5b2ca16b12a00eeb9def35069e8cb39ef26815c8995992ab2ece6008')

prepare() {
  cd $srcdir
  unzip src.zip
}

build() {
  cd $srcdir
  make  
}

package() {
  cd $srcdir
  install -Dm755 flips "$pkgdir"/usr/bin/flips
  install -Dm644 flips.desktop "$pkgdir"/usr/share/applications/flips.desktop
  install -Dm644 flips.png "$pkgdir"/usr/share/pixmaps/flips.png
  install -Dm644 "$srcdir"/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
