  # Maintainer:  solaraquarion <shlomochoina@gmial.com>
  # Maintainer:  derbetakevin <derbetakevin@outlook.de>
pkgname=extraterm-bin
_pkgname=extratermqt
pkgver=0.75.0
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
sha256sums=('3f9e50c7321c57a9efa52890613c252ba617f9203e9163eabcfa21d3da887387')
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

