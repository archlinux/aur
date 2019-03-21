# Maintainer: Timur Kiyivinski <timur@linux.com>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Darwin

pkgname=lbry-app-bin
pkgver=0.30.0
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring' 'gconf')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.30.0/LBRY_0.30.0.deb')
sha256sums=('860b75dd8beafb6306ba8ac8578a2c9b7b60e263860b66998c8b60beabd31b2f')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
