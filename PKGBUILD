# Maintainer: Jakub kubaszek10puchacz@gmail.com

pkgname=wingedit
pkgver=3.3.1
pkgrel=1
pkgdesc="Remote control program for Behringer Wing mixers"
arch=('x86_64' 'armv7h')
url="https://www.behringer.com/downloads.html"
license=('custom:MUSIC Group End User License Agreement')
depends=('alsa-lib' 'freetype2' 'libcurl-gnutls' 'libglvnd' 'libxext')
pkgbase=wingedit


source_x86_64=("https://cdn.mediavalet.com/aunsw/musictribe/cOBFJrXte0GPqwr6AfER2A/iwlHH7bEXE-X1AreNHQLvg/Original/Wing-Edit_LINUX_${pkgver}.tar.gz"
               "wingedit.png"
               "wingedit.desktop")  # Dodanie pliku .desktop do źródeł
source_armv7h=("https://cdn.mediavalet.com/aunsw/musictribe/4feATL_MLE2v0GfcxD8z8w/2L7p2gnBvE67LADZVADQ0g/Original/Wing-Edit_RASPI64_${pkgver}.tar.gz"
               "wingedit.png"
               "wingedit.desktop")

sha256sums_x86_64=('99ca0815313dc66d9709a4ad51d3fd1cb657fff9c637a60007dcfc0d9f6ba9f5'
                   'e8a8d3e1e433f256f0314804a1fed664ad21c2afe8df37062078aa692ea749cc'
                   'aa4ddc064fd05f0eed9833164686838682f0ff9df4e09f237eb6fc56ec94da7c')
sha256sums_armv7h=('d93a78c1b3acef65697b897374eef4e69c9677ae83edfba1b3c6ad6ea9b76a73'
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

