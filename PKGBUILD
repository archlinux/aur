# Maintainer: Dan Bright <productions at zaziork dot com>
pkgname=python-iptceditor-gtk3
pkgver=0.1
pkgrel=1
pkgdesc="NOTE: THIS IS BETA. USE AT YOUR OWN RISK. This is a python3 GTK3 wrapper for the EXIV2 application, which is used to read and edit IPTC (and other forms) of image metadata. It can handle bulk operations on directories of image files."
arch=('any')
url="https://github.com/ZWS2014/python-iptceditor-gtk3"
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
md5sums=('4ef13fd7e235091b332f1eb14b74594e')
package() {
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
