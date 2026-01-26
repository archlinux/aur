# Maintainer: Liam (DigitalEncryption/SelfhostedGuy)
# hello@selfhostedguy.com
pkgname=distroupdater
pkgver=2.1
pkgrel=1
pkgdesc="Cross-distro system updater (Arch, Debian, Fedora, Termux)"
arch=('any')
url="https://github.com/digitalencryption/DistroUpdater"
license=('MIT')
depends=('python' 'unzip')
source=("https://github.com/digitalencryption/DistroUpdater/releases/download/$pkgver/DistroUpdaterv2.1.zip")
sha256sums=('SKIP')

package() {
    # Extract the ZIP to a temporary folder
    unzip -o "DistroUpdaterv2.1.zip" -d "$pkgdir/tmp"

    # Install the Python script to /usr/bin
    install -Dm755 "$pkgdir/tmp/DistroUpdaterV2.1.py" \
        "$pkgdir/usr/bin/distroupdater"

    # Install the banner file to /usr/share/distroupdate
    install -Dm644 "$pkgdir/tmp/banner.txt" \
        "$pkgdir/usr/share/distroupdater/banner.txt"
}
