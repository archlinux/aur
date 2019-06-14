# Maintainer: Timur Kiyivinski <timur@linux.com>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Darwin

pkgname=lbry-app-bin
pkgver=0.33.1
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring' 'gconf')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.33.1/LBRY_0.33.1.deb')
sha256sums=('ead469797a53cd094ecb9d40b93f2886e0444ce00a4d092268c6cb00ea268382')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm775 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/LBRY" "$pkgdir/usr/bin/lbry"
}
