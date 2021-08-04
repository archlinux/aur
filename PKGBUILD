# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Maxwell Anselm

pkgname="gcs"
pkgver=4.34.0
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
url="https://gurpscharactersheet.com"
license=("MPL2")
arch=("x86_64")
depends=("java-runtime>=15")
source=("$pkgname-$pkgver.deb::https://github.com/richardwilkes/gcs/releases/download/v$pkgver/gcs_$pkgver-1_amd64.deb")
sha256sums=('3bfb106a91c5406274683948de9179e4865fb4e7b8b39c5ca29f646550867a92')

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
