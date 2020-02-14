# Maintainer: Dafne Kiyui <didyouknowthat@dafne.rocks>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Kelvin

pkgname=lbry-app-bin
pkgver=0.42.0
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
# dpkg -I $pkg.deb | grep Depends
# gconf deprecated: https://github.com/electron/electron/issues/2727
# gnome-keyring still required: https://github.com/lbryio/lbry-desktop/issues/386
depends=('libnotify' 'libappindicator' 'libxtst' 'nss' 'libsecret' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.42.0/LBRY_0.42.0.deb')
sha256sums=('562b5342ff2972128c77b2992984e69dd0ba8f294ddf074f173826f63e464b90')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
