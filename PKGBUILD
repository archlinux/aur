  # Maintainer:  solaraquarion <shlomochoina@gmial.com>
pkgname=extraterm-bin
_pkgname=extraterm
pkgver=0.57.1
pkgrel=1
conflicts=("extraterm")
pkgdesc="The swiss army chainsaw of terminal emulators."
arch=("x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
depends=("nodejs")
source=("$url/releases/download/v$pkgver/"$_pkgname"_"$pkgver"_amd64.deb")
sha256sums=('c604b18ccf5f40b5021b1dac953af82e8a88d26ed7f95ad59b85bd4c7396f52c')

package() {
  cd $srcdir

  tar -xf data.tar.xz
  cp -r usr/ $pkgdir
  cp -r opt/ $pkgdir

   install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
#!/usr/bin/bash
/opt/extraterm/extraterm
END

  install -Dm755 $pkgdir/opt/$_pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$_pkgname/copyright
}
