# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Maxwell Anselm

pkgname="gcs"
pkgver=4.27.0
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
url="https://gurpscharactersheet.com"
license=("MPL2")
arch=("x86_64")
depends=("java-runtime")
source=("$pkgname-$pkgver.deb::https://github.com/richardwilkes/gcs/releases/download/v$pkgver/gcs_$pkgver-1_amd64.deb")
sha256sums=("1a6e25f7771ed4bdb1367a22c4299934286e3c949b732e22bae0ab75d58a221c")

prepare(){
 tar -xf "data.tar.xz"
 sed -i "s|Icon=/opt/gcs/lib/GCS.png|Icon=gcs|" "opt/gcs/lib/gcs-GCS.desktop"
}

package(){
 cp -r "opt" "$pkgdir"
 install -D -m 644 "opt/gcs/lib/gcs-GCS.desktop" "$pkgdir/usr/share/applications/gcs.desktop"
 install -D -m 644 "opt/gcs/lib/GCS.png" "$pkgdir/usr/share/pixmaps/gcs.png"
 install -D -m 644 "opt/gcs/share/doc/copyright" "$pkgdir/usr/share/licenses/gcs/LICENSE"
}
