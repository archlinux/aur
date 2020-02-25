# Maintainer: Dafne Kiyui <didyouknowthat@dafne.rocks>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Love Lace

pkgname=lbry-app-bin
pkgver=0.43.0
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
# dpkg -I $pkg.deb | grep Depends
# gconf deprecated: https://github.com/electron/electron/issues/2727
# gnome-keyring still required: https://github.com/lbryio/lbry-desktop/issues/386
depends=('libnotify' 'libappindicator' 'libxtst' 'nss' 'libsecret' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.43.0/LBRY_0.43.0.deb')
sha256sums=('b2daef26ded025beadfb3f1858b046f4e65b99e0dcc5fcd1f1467d3315aadb47')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
