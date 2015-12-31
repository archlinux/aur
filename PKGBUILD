# Maintainer: Dan Bright <productions at zaziork dot com>
pkgname=python-iptceditor-gtk3
pkgver=0.1
pkgrel=1
pkgdesc="A Python based GTK wrapper for exiv2, to read and edit IPTC image tags"
arch=('any')
url="https://www.zaziork.com"
license=('GPL3')
#groups=()
depends=('exiv2' 'python>=3.0.0', 'desktop-file-utils')
#makedepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=(!emptydirs)
#install=
#changelog=
#source=($pkgname-$pkgver.tar.gz)
source=("IptcEditor-0.1.tar.gz")
#noextract=()
md5sums=('bec0645ce86d5b3cb14b711396bad1e6')
package() {
  #cd "$srcdir/$pkgname-$pkgver"
   cd "$srcdir/IptcEditor-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/IptcEditor-$pkgver/resources/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/IptcEditor-$pkgver/resources/iptc_editor-256x256.png" "$pkgdir/usr/share/pixmaps/iptc_editor-256x256.png"
}
post_install() {
update-desktop-database -q
}
post_remove() {
update-desktop-database -q
}
