# Maintainer: Timur Kiyivinski <timur@linux.com>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Darwin

pkgname=lbry-app-bin
pkgver=0.33.0rc1
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring' 'gconf')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.33.0-rc.1/LBRY_0.33.0-rc.1.deb')
sha256sums=('c287818769d910d1f3f839ce41f6093907b353ff087a4160abe7c0b085b354eb')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/LBRY" "$pkgdir/usr/bin/lbry"
}
