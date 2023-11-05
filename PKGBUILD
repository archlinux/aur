  # Maintainer:  solaraquarion <shlomochoina@gmial.com>
  # Maintainer:  derbetakevin <derbetakevin@outlook.de>
pkgname=extraterm-bin
_pkgname=extratermqt
pkgver=0.74.0
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
sha256sums=('e1b88c8338a26e60c99a92b63199988c7763a91e773bd0e925193e754f30cc8b')
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

