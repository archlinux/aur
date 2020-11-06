  # Maintainer:  solaraquarion <shlomochoina@gmial.com>
pkgname=extraterm-bin
_pkgname=extraterm
pkgver=0.55.0
pkgrel=1
conflicts=("extraterm")
pkgdesc="The swiss army chainsaw of terminal emulators."
arch=("x86_64")
url="https://github.com/sedwards2009/extraterm"
license=("MIT")
depends=("nodejs")
source=("$url/releases/download/v$pkgver/"$_pkgname"_"$pkgver"_amd64.deb")
sha256sums=('5ee0c1a9b9b03e4789997fd7a8945af65098d7a54070198ec572bf24945b8d42')

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
