# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago-bin
pkgver=3.4.2
pkgrel=1
pkgdesc="An open-source terminal emulator built on web technology
An open-source terminal emulator built on web technology"
arch=("x86_64")
url="https://github.com/npezza93/archipelago"
license=("MIT")
conflicts=('archipelago')
depends=('nodejs' 'glib2')
source=("$url/releases/download/v$pkgver/Archipelago_${pkgver}_amd64.deb")
sha512sums=('b357b28d7ab0a1f6085e66f79f187f00cad85d5d7455f4d62ede40a25a3da27965f9fe8723a53c625bac08ea3035b1ce6dfa85d75c91529a82a619b304a70873')
 
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
