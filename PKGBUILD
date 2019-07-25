# Maintainer: Timur Kiyivinski <timur@linux.com>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Erikson

pkgname=lbry-app-bin
pkgver=0.34.0
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring' 'gconf')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.34.0/LBRY_0.34.0.deb')
sha256sums=('66cf4bd04078105df95a3487bb70dcc1b4c02614aaadaf322f7cc433ecdd5a47')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm775 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/LBRY" "$pkgdir/usr/bin/lbry"
}
