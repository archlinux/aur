# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Maxwell Anselm

pkgname=gcs
pkgver=4.23.1
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
arch=("x86_64")
url="https://gurpscharactersheet.com"
license=("MPL-2.0")
depends=("java-runtime")
source=("$pkgname-$pkgver.deb::https://github.com/richardwilkes/gcs/releases/download/v$pkgver/gcs_$pkgver-1_amd64.deb")
md5sums=("61cc4023636c580fe012367d198f21d5")

prepare(){
 tar -xvf data.tar.xz
 sed -i "s|Icon=/opt/gcs/lib/GCS.png|Icon=gcs|" "opt/gcs/lib/gcs-GCS.desktop"
}

package(){
 cp -r "opt" "$pkgdir"
 install -d "$pkgdir/usr/share/applications"
 install -d "$pkgdir/usr/share/pixmaps"
 install "opt/gcs/lib/gcs-GCS.desktop" "$pkgdir/usr/share/applications/gcs.desktop"
 install "opt/gcs/lib/GCS.png" "$pkgdir/usr/share/pixmaps/gcs.png"
}
