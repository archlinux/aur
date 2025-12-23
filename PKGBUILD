pkgname=mangayomi-appimage
pkgver=0.6.90
pkgrel=1
pkgdesc="Mangayomi - Manga, Anime and Novel reader (AppImage)"
arch=('x86_64')
url="https://github.com/kodjodevf/mangayomi"
license=('GPL3')
depends=('fuse2')
options=(!strip)
provides=('mangayomi')
conflicts=('mangayomi' 'mangayomi-git')

source=("Mangayomi.AppImage::https://github.com/kodjodevf/mangayomi/releases/download/v${pkgver}/Mangayomi-v${pkgver}-linux.AppImage")
sha256sums=('SKIP')

package() {
  install -Dm755 "$startdir/Mangayomi.AppImage" "$pkgdir/opt/mangayomi/mangayomi.AppImage"

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/mangayomi.desktop" <<EOF
[Desktop Entry]
Name=Mangayomi
Exec=/opt/mangayomi/mangayomi.AppImage
Icon=mangayomi
Type=Application
Categories=AudioVideo;Video;
Terminal=false
EOF
}
