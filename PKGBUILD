# Maintainer: Timur Kiyivinski <timur@linux.com>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Isaac

pkgname=lbry-app-bin
pkgver=0.38.0
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring' 'gconf')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.38.0/LBRY_0.38.0.deb')
sha256sums=('39c9978f3e6069ea241d35622281505521888fc4112438adbbb3d6fcfa5dc7e2')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm775 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/LBRY" "$pkgdir/usr/bin/lbry"
}
