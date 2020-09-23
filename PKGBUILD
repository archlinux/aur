# Maintainer: Dafne Kiyui <didyouknowthat@dafne.rocks>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Pausch

pkgname=lbry-app-bin
pkgver=0.48.0
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
provides=('lbry' 'lbrynet')
# dpkg -I $pkg.deb | grep Depends
# gconf deprecated: https://github.com/electron/electron/issues/2727
# gnome-keyring still required: https://github.com/lbryio/lbry-desktop/issues/386
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.48.0/LBRY_0.48.0.deb')
sha256sums=('e62ab5f3e584406a0b191d92deed1ce431706c0efc9e5dcd4ac6fa4bfe0145ab')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
    ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
}

