# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Maxwell Anselm

pkgname="gcs"
pkgver=4.33.0
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
url="https://gurpscharactersheet.com"
license=("MPL2")
arch=("x86_64")
depends=("java-runtime>=15")
source=("$pkgname-$pkgver.deb::https://github.com/richardwilkes/gcs/releases/download/v$pkgver/gcs_$pkgver-1_amd64.deb")
sha256sums=('7e884393787272e282048e53d689305a9c85ce146b11e606a5c04bf2ab0d1d63')

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
