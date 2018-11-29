pkgname=hobbit
pkgver=1.2
pkgrel=4
pkgdesc="The Hobbit by Veronica Megler & Philip Mitchell"
arch=('any')
source=('https://archive.org/download/zx_Hobbit_The_v1.0_1982_Melbourne_House/Hobbit_The_v1.0_1982_Melbourne_House.z80'
	'https://archive.org/download/zx_Hobbit_The_v1.2_1982_Melbourne_House/Hobbit_The_v1.2_1982_Melbourne_House.z80')
depends=('fuse-emulator-sdl')
options=('!strip')
md5sums=('SKIP'
	 'SKIP')

prepare() {
  cd $srcdir
  echo '#!/bin/sh' > hobbit
  echo 'fuse --full-screen --no-statusbar -t /opt/xyz/hobbit/hobbit-1.2.z80' >> hobbit
}

package() {
    cd $srcdir
    mv Hobbit_The_v1.0_1982_Melbourne_House.z80 hobbit-1.0.z80
    mv Hobbit_The_v1.2_1982_Melbourne_House.z80 hobbit-1.2.z80

    install -Dvpm644 hobbit-1.0.z80 $pkgdir/opt/xyz/hobbit/hobbit-1.0.z80
    install -Dvpm644 hobbit-1.2.z80 $pkgdir/opt/xyz/hobbit/hobbit-1.2.z80
    install -Dvpm755 hobbit $pkgdir/usr/bin/hobbit
}
