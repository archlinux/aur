  # Maintainer:  solaraquarion <shlomochoina@gmial.com>
  # Maintainer:  derbetakevin <derbetakevin@outlook.de>
pkgname=extraterm-bin
_pkgname=extratermqt
pkgver=0.76.0
pkgrel=1
conflicts=("extraterm")
pkgdesc="The swiss army chainsaw of terminal emulators."
arch=("x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
depends=("nodejs" "qt6-svg" "gtk3" "hicolor-icon-theme"
         "gdk-pixbuf2" "at-spi2-core" "cairo" "pango"
          "krb5")
source=("$url/releases/download/v$pkgver/""${_pkgname}_""${pkgver}_amd64.deb")
sha256sums=('898f40b09e08c274141645af1ec7f0d3e949601548cc4c40f724720acb1cf304')
package() {
  cd "$srcdir"

  tar -xf data.tar.zst
  cp -r usr/ "$pkgdir"
  cp -r opt/ "$pkgdir"

   install -Dm755 /dev/stdin "$pkgdir"/usr/bin/"$_pkgname" <<END
#!/usr/bin/bash
/opt/extraterm/extraterm
END

  install -Dm755 "$pkgdir/opt/$_pkgname"/LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname"/copyright
}

