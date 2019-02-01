# Maintainer: Timur Kiyivinski <timur@linux.com>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Clarke

pkgname=lbry-app-bin
pkgver=0.28.0rc2
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.28.0-rc.2/LBRY_0.28.0-rc.2.deb')
sha256sums=('192b7724955fc6f075be3127466b1c7644cf42a1c8ef8949ccf125350bc7f0cd')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
