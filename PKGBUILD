# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-stable-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-app/releases/download/v0.15.1/LBRY_0.15.1_amd64.deb')
sha256sums=('2241c97cb4473bffce0cc2ad1a25dea1a93c980b71bb302991f7597960b49cc3')

package() {
    tar -xvf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
