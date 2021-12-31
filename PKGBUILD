# Maintainer: Dafne Kiyui <didyouknowthat@dafne.rocks>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Pausch

pkgname=lbry-app-bin
pkgver=0.52.0
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
provides=('lbry' 'lbrynet')
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
source=("https://github.com/lbryio/lbry-desktop/releases/download/v$pkgver/LBRY_$pkgver.deb")
sha512sums=('b131da951da16e2a22feb0ffc1fa022963dcbcbfb23b50d21ed697748f6d1c72e8eb9be5583204be4c8718f44f3195c0f9fab1ad63505f3d4aa40de8d20776a3')

package() {
    install -dm 755 "$pkgdir/usr/bin/"
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
    ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
}
