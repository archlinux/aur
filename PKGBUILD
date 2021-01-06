# Maintainer: Johnny Halfmoon < jhalfmoon at milksnot dot com >

pkgname=blheli-configurator
pkgver=1.2.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for BLHeli based ESCs"
arch=('x86_64')
url="https://github.com/blheli-configurator/blheli-configurator"
source=(
"https://github.com/blheli-configurator/blheli-configurator/releases/download/$pkgver/BLHeli-Configurator_linux64_"$pkgver".zip"
"https://github.com/blheli-configurator/blheli-configurator/blob/master/images/icon_128.png?raw=true"
"blheli-configurator.desktop"
)

md5sums=('cbd559872d35d97ad7af3b7f2257a309'
         '7ebf8dc82bf9cde6529da6166a8eb55f'
         'd3f44aeb4a87d478aa9421c8c0206a11')

options=(!strip)
license=('custom')
provides=("$pkgname")

package() {
  mkdir -p "$pkgdir/opt/blheli-configurator"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/blheli-configurator.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/icon_128.png?raw=true" "$pkgdir/opt/blheli-configurator/blheli_icon_128.png"
  cp -r --preserve=all "$srcdir/BLHeli Configurator/." "$pkgdir/opt/blheli-configurator"
  ln -s "/opt/blheli-configurator/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
