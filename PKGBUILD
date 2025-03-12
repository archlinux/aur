# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Michael Schoenwaelder <m.schoenwaelder@posteo.de>

pkgname=zettelkasten-bin
_pkgname=zettelkasten
_Pkgname=Zettelkasten
pkgver=3.2022.8
pkgrel=1
pkgdesc='Zettelkasten software based on the working principle of Niklas Luhmann (pre-compiled)'
arch=('any')
url='https://github.com/Zettelkasten-Team/Zettelkasten'
license=('GPL-3.0-or-later')
depends=('java-runtime' 'sh')
provides=('zettelkasten')
conflicts=('zettelkasten')
source=(
  "$_pkgname-$pkgver.zip::$url/releases/download/v$pkgver/Package.jar.and.exe.zip"
  "$_pkgname.sh"
  "$_pkgname.desktop"
)
sha256sums=(
  '0153689c8e595799711d6cfce7f619c72dce644ba1f2686910d9eab8ee1ff6ba'
  'SKIP' 'SKIP'
)

package() {
  install -vDm0644 "$srcdir/$_Pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
  install -vDm0755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -vDm0644 -t "$pkgdir/usr/share/applications" "$_pkgname.desktop"
}

# eof
