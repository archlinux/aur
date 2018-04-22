# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago
pkgver=2.0.0
pkgrel=1
pkgdesc="
An open-source terminal emulator built on web technology"
arch=("x86_64")
url="https://github.com/npezza93/archipelago"
license=("MIT")
depends=('nodejs')
source=("$url/releases/download/v$pkgver/Archipelago_${pkgver}_amd64.deb")
sha512sums=('3fac44cbfb706ba7e419d47586d23accca47dee4bd1153ed2820d9861ed8d921c6741d588662de810d2a7702d88a12989fb7802184bbc866175d1434d45f492c')
 
prepare() {
  cd $srcdir

  msg2 "  -> Extracting files..."
  tar -xf data.tar.xz
}

package() {
  cd $srcdir

  msg2 "  -> Installing program..."

  cp -r {opt/,usr/} $pkgdir/
  
install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
     #!/usr/bin/bash
    /opt/Archipelago/archipelago
END

}
