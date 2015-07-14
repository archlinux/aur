# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=rhythmbox-llyrics
pkgver=1.0
pkgrel=1
pkgdesc="A Rhythmbox plugin for displaying lyrics in the sidebar."
url="https://github.com/dmo60/lLyrics"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('rhythmbox>=3.0' 'python-chardet' 'python-lxml' )
install=$pkgname.install
source=("https://github.com/dmo60/lLyrics/archive/v$pkgver.zip")
md5sums=('a1d19eb0663c2d4027aa5b5af9d2b50c')

_plugin_name=llyrics

package() {
  cd "$srcdir/lLyrics-$pkgver"

  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  mkdir -p "$pkgdir/usr/share/glib-2.0/schemas/"
  cp -R *.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/"

  cd "${srcdir}/lLyrics-$pkgver/lLyrics"
  mkdir -p "$pkgdir/usr/lib/rhythmbox/plugins/$_plugin_name"
  cp -R {*.py,*.plugin,*.png,../README.md} "$pkgdir/usr/lib/rhythmbox/plugins/$_plugin_name/"

  mkdir -p "$pkgdir/usr/share/rhythmbox/plugins/$_plugin_name/"
  cp -R locale "$pkgdir/usr/share/rhythmbox/plugins/$_plugin_name/"
}
