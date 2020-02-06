# Maintainer: Dafne Kiyui <didyouknowthat@dafne.rocks>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Kelvin

pkgname=lbry-app-bin
pkgver=0.41.0
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
# dpkg -I $pkg.deb | grep Depends
# gconf deprecated: https://github.com/electron/electron/issues/2727
# gnome-keyring still required: https://github.com/lbryio/lbry-desktop/issues/386
depends=('libnotify' 'libappindicator' 'libxtst' 'nss' 'libsecret' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.41.0/LBRY_0.41.0.deb')
sha256sums=('5504176d2d645d5cc06c51aaea6e805a0f0c5961a6e3c46bc26e3bf7bc97fb6c')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
