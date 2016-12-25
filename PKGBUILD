pkgname=groupme
pkgver=1.1.1
pkgrel=1
pkgdesc="Unofficial GroupMe App"
arch=('x86_64')
url="https://github.com/dcrousso/GroupMe"
license=('MIT')
depends=('electron')
options=('!docs' '!emptydirs')
source=("https://github.com/dcrousso/GroupMe/releases/download/v1.1.1/GroupMe-linux-1.1.1.zip" "groupme.desktop")
md5sums=('f9c72829456c3f56341a029488a0c17f' '82e829e0ad8ed756453569edc6cddeb9')
package() {
  mkdir $pkgdir/opt/
  unzip GroupMe-linux-1.1.1.zip -d "$pkgdir/"
  mv "$pkgdir/GroupMe-linux-x64/" "$pkgdir/opt/groupme"
  rm -rf "$pkgdir/GroupMe-linux-x64/"

  # Link to the binary
  mkdir $pkgdir/usr/
  mkdir $pkgdir/usr/share/
  mkdir $pkgdir/usr/share/applications/
  cp groupme.desktop $pkgdir/usr/share/applications/
}
