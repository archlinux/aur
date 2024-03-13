# Maintainer: LINUX-GAMING.RU (tergoevm@gmail.com)

pkgname=portproton
pkgver=1.5
pkgrel=1
pkgdesc="Software for playing Microsoft Windows games and launchers"
arch=('x86_64')
url="https://linux-gaming.ru"
license=('MIT')
depends=('bash' 'icoutils' 'yad' 'bubblewrap' 'zstd' 'cabextract' 'gzip'
         'tar' 'openssl' 'openssl-1.1' 'desktop-file-utils' 'curl' 'dbus' 'freetype2' 'xdg-utils'
         'gdk-pixbuf2' 'ttf-font' 'nss' 'xorg-xrandr' 'lsof' 'mesa-utils' 'imagemagick'
         'vulkan-driver' 'vulkan-icd-loader' 'lib32-libgl' 'lib32-gcc-libs' 'vulkan-tools'
         'lib32-libx11' 'lib32-libxss' 'lib32-alsa-plugins' 'lib32-libgpg-error' 'lib32-freetype2'
         'lib32-nss' 'lib32-vulkan-driver' 'lib32-vulkan-icd-loader' 'lib32-openssl' 'lib32-openssl-1.1' 'lib32-mesa-utils' 'python-pillow')
optdepends=('gamemode: Support for Feral GameMode'
            'lib32-gamemode: 32-bit support for Feral GameMode'
            'gamescope: Support for Gamescope'
            'icoextract: For proper icon creation in GNOME')
_commit=266bd56
source=("git+https://github.com/Castro-Fidel/PortProton_ALT.git#commit=$_commit")
sha256sums=('SKIP')
_gitname=PortProton_ALT
#source=("https://raw.githubusercontent.com/Castro-Fidel/PortWINE/master/portwine_install_script/PortProton_1.0"
#        "$pkgname.desktop"
#        "https://raw.githubusercontent.com/Castro-Fidel/PortProton_PKGBUILD/main/$pkgname.svg"
#        "$pkgname.metainfo.xml"
#        "LICENSE")
#sha256sums=('259926ee57dfd4ab2c25f3c826e3ee79e01af95254aa94bd4f141efdeb13c315'
#            '17d2c7bc99707a88ec13422ff40f33004c8a41bf945143122d5ee0f6a3be3bce'
#            'df2850787a0777bfd446bed40c6c2bcd6ce5636a241dfe08a6a915f151b20fd4'
#            '12cf6820ac4145580df1c48e419dff3f4f7545790e45efc0332623b5e70633fe'
#            '65d12e4e0be4dd5e58324593563c8c79af42876d63f51225364b968117c6ff4f')

package() {
  install -Dm755 "$srcdir/$_gitname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$_gitname/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/$_gitname/$pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
#  install -Dm644 "$pkgname.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "$srcdir/$_gitname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
