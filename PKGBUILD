# Maintainer: Timur Kiyivinski <timur@linux.com>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Darwin

pkgname=lbry-app-bin
pkgver=0.34.0rc5
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring' 'gconf')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.34.0-rc.5/LBRY_0.34.0-rc.5.deb')
sha256sums=('07d238837fcc20fbe8a741d433e5826c594118499349d67c5f2cef22fed30bb5')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm775 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/LBRY" "$pkgdir/usr/bin/lbry"
}
