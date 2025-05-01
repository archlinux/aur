# Maintainer: Jakub kubaszek10puchacz@gmail.com

pkgname=wingedit
pkgver=3.2.1
pkgrel=2
pkgdesc="Remote control program for Behringer Wing mixers"
arch=('x86_64' 'armv7h')
url="https://www.behringer.com/downloads.html"
license=('custom:MUSIC Group End User License Agreement')
depends=('alsa-lib' 'freetype2' 'libcurl-gnutls' 'libglvnd' 'libxext')
pkgbase=wingedit


source_x86_64=("https://github.com/Jacobeagle/wing-edit-app-stable-url/releases/download/wing-edit/Wing-Edit_LINUX_${pkgver}.tar.gz"
               "wingedit.png"
               "wingedit.desktop")  # Dodanie pliku .desktop do źródeł
source_armv7h=("https://github.com/Jacobeagle/wing-edit-app-stable-url/releases/download/wing-edit/Wing-Edit_RASPI64_${pkgver}.zip"
               "wingedit.png"
               "wingedit.desktop")

sha256sums_x86_64=('66b9ddcc7a26afc9d8fc534cabe65d8d3cd903c8587e5cad80b0377a6f8fdd70'
                   'e8a8d3e1e433f256f0314804a1fed664ad21c2afe8df37062078aa692ea749cc'
                   'aa4ddc064fd05f0eed9833164686838682f0ff9df4e09f237eb6fc56ec94da7c')
sha256sums_armv7h=('25550a6640a3738e3dedb854dfbdd8f2f0c2ada170720057b5569ac9d053b262'
                   'e8a8d3e1e433f256f0314804a1fed664ad21c2afe8df37062078aa692ea749cc'
                   'aa4ddc064fd05f0eed9833164686838682f0ff9df4e09f237eb6fc56ec94da7c')

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
} #this thing does what it was made for so you can install this app. However idk why it just doesn't update on AUR

