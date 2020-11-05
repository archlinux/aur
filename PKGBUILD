# Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=lightcord-appimage
pkgver=0.14
pkgrel=1
pkgdesc="A simple - customizable - Discord Client"
arch=('x86_64')
url="https://github.com/Lightcord/Lightcord"
license=('MIT')
depends=()
optdepends=('picom: transparency support')
makedepends=()
provides=('lightcord')
conflicts=('lightcord-bin' 'lightcord-git')
source=("lightcord.AppImage::https://lightcord.org/api/gh/releases/Lightcord/Lightcord/dev/lightcord-linux-x86_64.AppImage"
	"lightcord.desktop"
	"lightcord.png::https://raw.githubusercontent.com/Lightcord/LightcordLogos/master/lightcord/lightcord.png")

md5sums=('SKIP'
	 'SKIP'
	 'SKIP')

package() {
    # Link icon and add Desktop
    ln -s /opt/lightcord/lightcord.png "$pkgdir"/usr/share/pixmaps/lightcord.png
    install -Dm644 "$srcdir"/Lightcord.desktop -t "$pkgdir"/usr/share/applications
    install -Dm644 "$srcdir"/lightcord.AppImage -t "$pkgdir"/usr/bin
    install -Dm644 "$srcdir"/lightcord.png -t "$pkgdir"/usr/share/pixmaps
    chmod 755 "$pkgdir"/usr/bin/lightcord.AppImage
}


