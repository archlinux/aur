# Maintainer : Ainola
# Contributor: speps
# Contributor: Bernardo Barros
# Contributor: Lars Boettcher

pkgname=csound-doc
pkgver=6.09.0
pkgrel=1
pkgdesc="The Canonical Csound Reference Manual"
url="http://csound.github.io"
arch=('any')
license=('LGPL' 'GPL')
optdepends=('csound')
# This is a hardcoded link because the devs change the naming convention often.
source=("https://github.com/csound/csound/releases/download/${pkgver}/Csound${pkgver:0:-2}_manual_html.zip")
sha256sums=('01167a26f5e51cbb073cb48d193aaf4803f8c1d83321a2fad2344f1d50d6034a')

package() {
  install -d "$pkgdir/usr/share/doc/csound-doc/html"
  cp -a "$srcdir"/html/* "$pkgdir/usr/share/doc/csound-doc/html"

  find "$pkgdir" -type f -exec chmod 644 {} \;
}
