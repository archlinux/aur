# Maintainer: Diramix 39developer@diram1x.ru
pkgname=next-music
pkgver=2.0.0
pkgrel=1
pkgdesc="Web client for Yandex Music with support for themes and addons"
arch=('x86_64')
url="https://github.com/Web-Next-Music/Next-Music-Client"
license=('MIT')
depends=('glibc')
source=("https://github.com/Web-Next-Music/Next-Music-Client/releases/download/Next-Music-${pkgver}/Next-Music-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
    # Устанавливаем AppImage в /usr/bin
    install -Dm755 "$srcdir/Next-Music-${pkgver}.AppImage" "$pkgdir/usr/bin/next-music"

    # Создаём папку для иконок и десктоп файла
    install -Dm644 "$srcdir/Next-Music-${pkgver}.AppImage" "$pkgdir/usr/share/icons/hicolor/256x256/apps/next-music.png"

    # Desktop-файл для меню приложений
    cat > "$pkgdir/usr/share/applications/next-music.desktop" <<EOF
[Desktop Entry]
Name=Next Music
Comment=Web client for Yandex Music with support for themes and addons
Exec=/usr/bin/next-music
Icon=next-music
Type=Application
Categories=Audio;Music;
Terminal=false
EOF
}
