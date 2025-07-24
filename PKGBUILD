# Maintainer: noxygalaxy <nooxxyyywork@gmail.com\>

pkgname=twlauncher-bin
pkgver=1.2.1
pkgrel=2
_version=${pkgver/rc/-rc}
pkgdesc="Launcher for most popular Teeworlds clients."
arch=('x86_64')
url="https://twlauncher.netlify.app/"
license=('MIT')
depends=('freetype2' 'curl' 'libnotify' 'sqlite' 'fuse' 'gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libxi')
checkdepends=('gmock')
optdepends=('discord-game-sdk: Enable rich presence in Discord desktop client.')
backup=('usr/share/ddnet/data/autoexec_server.cfg')
source=("https://github.com/noxygalaxy/TWLauncher/releases/download/v$_version/TWLauncher-x86_64.AppImage" "run.sh" "twlauncher.desktop" "twlauncher.png")
sha256sums=('2762db727989a1fbc23ba2124263e7606d7534d74448fb824d041a44ad385d21'
            'd6f27be58f886699e133cff4bfa7dac43c4fe4e6be47c966f727e0441a0bf6b8'
            '799007ac487e652bbfeaebc1915f7d024d01706bb34994a846854682c8879dca'
            'd7a0e8ac291af121931ebd31ed5e92fb94807ef58f9426a5fd0124e80da30e0b')

prepare() {
    chmod +x $srcdir/TWLauncher-x86_64.AppImage
    chmod +x $srcdir/run.sh
}

package() {
    install -dm0755 "$pkgdir/opt/$pkgname"
    cp -a $srcdir/TWLauncher-x86_64.AppImage "$pkgdir/opt/$pkgname/TWLauncher-x86_64.AppImage"
    install -vDm644 "$srcdir/run.sh" "$pkgdir/usr/bin/twlauncher"
    chmod +x $pkgdir/usr/bin/twlauncher
    install -vDm644 "$srcdir/twlauncher.desktop"  "$pkgdir/usr/share/applications/twlauncher.desktop"
    install -Dm0644 "$srcdir/twlauncher.png" "$pkgdir/opt/twlauncher/twlauncher.png"
}
