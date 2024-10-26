# Maintainer: Jakub <twojemail@domena.com>

pkgname=wingedit
pkgver=3.0
pkgrel=1
pkgdesc="Remote control program for Behringer Wing mixers"
arch=('x86_64' 'armv7h')
url="https://www.behringer.com/downloads.html"
license=('custom:MUSIC Group End User License Agreement')
depends=('alsa-lib' 'freetype2' 'libcurl-gnutls' 'libglvnd' 'libxext')
pkgbase=wingedit


source_x86_64=("https://mediadl.musictribe.com/download/software/behringer/WING/EDIT/Wing-Edit_LINUX_${pkgver}.tar.gz"
               "wingedit.png"
               "wingedit.desktop")  # Dodanie pliku .desktop do źródeł
source_armv7h=("https://mediadl.musictribe.com/download/software/behringer/WING/EDIT/Wing-Edit_RASPI64_${pkgver}.tar.gz"
               "wingedit.png"
               "wingedit.desktop")

sha256sums_x86_64=('SKIP' 'SKIP' 'SKIP')
sha256sums_armv7h=('SKIP' 'SKIP' 'SKIP')

package() {
    # Rozpakowanie archiwum
    cd "$srcdir"
    tar -xzf Wing-Edit_LINUX_${pkgver}.tar.gz

    # Instalacja pliku wykonywalnego do /usr/bin
    install -Dm755 WING-Edit "$pkgdir/usr/bin/wingedit"

    # Instalacja ikony do /usr/share/pixmaps
    install -Dm644 "$srcdir/wingedit.png" "$pkgdir/usr/share/pixmaps/wingedit.png"

    # Instalacja pliku .desktop
    install -Dm644 "$srcdir/wingedit.desktop" "$pkgdir/usr/share/applications/wingedit.desktop"
}
