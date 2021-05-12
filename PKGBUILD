  # Maintainer:  solaraquarion <shlomochoina@gmial.com>
pkgname=extraterm-bin
_pkgname=extraterm
pkgver=0.59.2
pkgrel=1
conflicts=("extraterm")
pkgdesc="The swiss army chainsaw of terminal emulators."
arch=("x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
depends=("nodejs")
source=("$url/releases/download/v$pkgver/""${_pkgname}_""${pkgver}_amd64.deb")
sha256sums=('d679aff045cf4db5b8dc4a234ae0907eb264d6bd511d41862ef82448d4c94123')

package() {
  cd "$srcdir"

  tar -xf data.tar.xz
  cp -r usr/ "$pkgdir"
  cp -r opt/ "$pkgdir"

   install -Dm755 /dev/stdin "$pkgdir"/usr/bin/"$_pkgname" <<END
#!/usr/bin/bash
/opt/extraterm/extraterm
END

  install -Dm755 "$pkgdir/opt/$_pkgname"/LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname"/copyright
}
