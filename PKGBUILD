# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-bin
pkgver=0.16.0
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-app/releases/download/v0.16.0/LBRY_0.16.0_amd64.deb')
sha256sums=('844a789382db546d33f7482e8d936d5bb0d2d15cf27293822119b54866ff7e3a')

package() {
    tar -xvf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
