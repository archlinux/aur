# Maintainer: ItsAshn
pkgname=kioku
pkgver=0.10.4
pkgrel=1
pkgdesc="Application time tracker — know where your hours go"
arch=('x86_64')
url="https://github.com/ItsAshn/Kioku"
license=('custom:UNLICENSED')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 
         'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 
         'libnotify' 'libappindicator-gtk3')
source=("$pkgname-$pkgver.pacman::$url/releases/download/v$pkgver/kioku-$pkgver.pacman")
sha256sums=('3d869d24d59959c67b79cd336e4b028119910f2ac27739fbebdd49d4a8d3a9a7')

package() {
    # Extract to temp directory first
    mkdir -p "$srcdir/extract"
    tar -xJf "$srcdir/$pkgname-$pkgver.pacman" -C "$srcdir/extract"
    
    # Copy only application files (not metadata dotfiles)
    cp -r "$srcdir/extract/opt" "$pkgdir/"
    cp -r "$srcdir/extract/usr" "$pkgdir/"
}
