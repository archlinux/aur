## Maintainer: Cain Atkinson <yellowsink@protonmail.com>

pkgname=armcord-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Discord client for lower end and ARM devices."
arch=('x86_64' 'aarch64')
url="https://github.com/smartfrigde/armcord"
license=('MIT')
options=(!strip)

source_x86_64=("https://github.com/smartfrigde/armcord/releases/download/v2.5.0/ArmCord-2.5.0.tar.gz")
sha256sums=("022c6944ee1111e657b8d9899a2c7fd92f6dc42a34e6f08e4aa54a0f844a7c6f")

package() {
    # enter directory
    cd "$srcdir/ArmCord-2.5.0"

    # move all files to the appropriate place
    mkdir -p "$pkgdir/opt/armcord"
    cp -r * "$pkgdir/opt/armcord/"

    # fix perms
    chmod 644 -R "$pkgdir/opt/armcord/"*
    chmod 755 "$pkgdir/opt/armcord/armcord"

    # create link
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/armcord/armcord" "$pkgdir/usr/bin/armcord"
}
