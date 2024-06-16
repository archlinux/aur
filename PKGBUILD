# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=liblast-bin
pkgver=2023.12.30
pkgrel=1
pkgdesc="A libre multiplayer FPS game and framework built using Godot game engine and a fully open-source tool chain (PREVIEW) (binary release)"
url="https://codeberg.org/Liblast/Liblast"
license=('MIT')
arch=('x86_64')
depends=('hicolor-icon-theme')
provides=("liblast")
conflicts=("liblast")
source=("liblast-$pkgver.zip::https://libla.st/downloads/Liblast_dev.zip"
        "$url/raw/commit/c901da2dbc7307c755c67369b462c6997351dbca/LICENSE"
        "$url/raw/commit/ef8b6acd473048b09bbec2c1a093b7d703acb7f0/src/game/icon.svg")
sha256sums=('6f4a86286484b14ed447b610d578722eabc51aa32c55d817d83702d1665ae316'
            'f986b15a47941613ad5414aef3738a4157313af1f23c9cc79695e1268ad5094e'
            '189f1492895cd2c8a8b4a95ee7d6965bc4aa7e82e635e8415d6d83ca0e324d98')

prepare(){
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=liblast\n\
Comment=A libre multiplayer FPS game and framework built using Godot game engine and a fully open-source tool chain\n\
Exec=liblast %U\n\
Icon=liblast\n\
Terminal=false\n\
Type=Application\n\
Categories=Game;" > liblast.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib/liblast"
# Install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/liblast"
  install -Dm644 liblast.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/liblast.svg"
  install -Dm644 Liblast.pck -t  "$pkgdir/usr/lib/liblast"
  install -Dm755 Liblast.x86_64 -t "$pkgdir/usr/lib/liblast"
  ln -s /usr/lib/liblast/Liblast.x86_64 "$pkgdir/usr/bin/liblast"
}
