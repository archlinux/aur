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
	"https://raw.githubusercontent.com/Lightcord/Lightcord/master/LICENSE"
	"lightcord.png::"https://raw.githubusercontent.com/Lightcord/Lightcord/master/discord.png)

md5sums=('SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP')

package() {
    # Link icon and add Desktop
    install -Dm644 "$srcdir"/lightcord.desktop -t "$pkgdir"/usr/share/applications
    install -Dm644 "$srcdir"/lightcord.AppImage -t "$pkgdir"/usr/bin
    install -Dm644 "$srcdir"/lightcord.png -t "$pkgdir"/usr/share/pixmaps
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chmod 755 "$pkgdir"/usr/bin/lightcord.AppImage
}


