# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="An open-source terminal emulator built on web technology
An open-source terminal emulator built on web technology"
arch=("x86_64")
url="https://github.com/npezza93/archipelago"
license=("MIT")
conflicts=('archipelago')
depends=('nodejs' 'glib2')
source=("$url/releases/download/v$pkgver/Archipelago_${pkgver}_amd64.deb")
sha512sums=('9de141580bacb5835910d176d6d6af707e3dececd940c9b067d78bd088cd2e2c54170a60657310b23fa830929e3964d12d3c1b8dcd76736b4d26a4687bad0a82')
 
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
