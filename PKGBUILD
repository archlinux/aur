  # Maintainer:  solaraquarion <shlomochoina@gmial.com>
  # Maintainer:  derbetakevin <derbetakevin@outlook.de>
pkgname=extraterm-bin
_pkgname=extratermqt
pkgver=0.70.0
pkgrel=1
conflicts=("extraterm")
pkgdesc="The swiss army chainsaw of terminal emulators."
arch=("x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
depends=("nodejs" "qt6-svg")
source=("$url/releases/download/v$pkgver/""${_pkgname}_""${pkgver}_amd64.deb")
sha256sums=('0e32ce89c9c555adc5be59a304e8f56c6045b33b5c186ff8b163a9255c2590fb')

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
