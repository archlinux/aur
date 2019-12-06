# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago-bin
pkgver=3.8.1
pkgrel=1
pkgdesc="An open-source terminal emulator built on web technology
An open-source terminal emulator built on web technology"
arch=("x86_64")
url="https://github.com/npezza93/archipelago"
license=("MIT")
conflicts=('archipelago')
depends=('nodejs' 'glib2')
source=("$url/releases/download/v$pkgver/Archipelago_${pkgver}_amd64.deb")
sha512sums=('c4134f42684a993a681685a62f69214736b1163dea3f6827e4371e9b4b26acbf4d7ea600793931c0d424e3a4ad26c995214f5123b359485e3865448d68402aac')
 
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
