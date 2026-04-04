# Maintainer: IlNinjaDiBattipaglia <fogliadonato2@gmail.com>
pkgname=abs-flutter-bin
pkgver=1.8.5
pkgrel=1
pkgdesc="Unofficial cross-platform client for Audiobookshelf (Buchable)"
arch=('x86_64')
url="https://github.com/Vito0912/abs_flutter"
license=('GPL-3.0-only')
depends=('gtk3' 'libsecret')
provides=('abs-flutter')
conflicts=('abs-flutter' 'buchable' 'buchable-git')
source=("linux-release-${pkgver}.zip::https://github.com/Vito0912/abs_flutter/releases/download/v${pkgver}/linux-release-${pkgver}.zip")
sha256sums=('df8454f50257ad842a6ed9c246ea26a3e709d87f5d8571ddfb8bf2ae12d9cd1c')

package() {
    install -dm755 "$pkgdir/opt/abs-flutter"
    cp -r "$srcdir/." "$pkgdir/opt/abs-flutter/"
    chmod +x "$pkgdir/opt/abs-flutter/abs_flutter"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/abs-flutter/abs_flutter" "$pkgdir/usr/bin/abs-flutter"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/abs-flutter.desktop" << DESKTOP
[Desktop Entry]
Name=Buchable
Comment=Audiobookshelf client
Exec=abs-flutter
Icon=abs-flutter
Type=Application
Categories=Audio;
DESKTOP
}
