# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago-bin
pkgver=3.13.0
pkgrel=1
pkgdesc="An open-source terminal emulator built on web technology
An open-source terminal emulator built on web technology"
arch=("x86_64")
url="https://github.com/npezza93/archipelago"
license=("MIT")
conflicts=('archipelago')
depends=('nodejs' 'glib2')
source=("$url/releases/download/v$pkgver/Archipelago_${pkgver}_amd64.deb")
sha512sums=('dc936580868a22376496ca8ddeeaf4a62041f13ee97150a6710a92dd05570c13e06f8b16be9ec80e1909569035c2330edc4138c5aad6b6e592aa6035d5366539')
 
prepare() {
  cd $srcdir

  tar -xf data.tar.xz
}

package() {
  cd $srcdir

  cp -r {opt/,usr/} $pkgdir/
  
install -Dm755 /dev/stdin "$pkgdir"/usr/bin/archipelago <<END
    #!/usr/bin/bash
    /opt/Archipelago/archipelago
END

}
