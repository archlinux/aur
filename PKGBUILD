# Maintainer: Dafne Kiyui <didyouknowthat@dafne.rocks>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Love Lace

pkgname=lbry-app-bin
pkgver=0.43.4
pkgrel=2
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
# dpkg -I $pkg.deb | grep Depends
# gconf deprecated: https://github.com/electron/electron/issues/2727
# gnome-keyring still required: https://github.com/lbryio/lbry-desktop/issues/386
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.43.4/LBRY_0.43.4.deb')
sha256sums=('172e3ffc3698888d668128732cff078b0eef24fdcb75350ef17c4cb473f21310')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
