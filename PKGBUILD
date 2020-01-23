# Maintainer: Dafne Kiyui <didyouknowthat@dafne.rocks>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Joule

pkgname=lbry-app-bin
pkgver=0.39.0
pkgrel=2
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
# dpkg -I $pkg.deb | grep Depends
# gconf deprecated: https://github.com/electron/electron/issues/2727
depends=('libnotify' 'libappindicator' 'libxtst' 'nss' 'libsecret')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.39.0/LBRY_0.39.0.deb')
sha256sums=('0aa85c5671cf442efac7c1cb7fe443bdc6243515cc0dadbee8dae70ccfe69a47')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
