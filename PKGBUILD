# Maintainer: Dafne Kiyui <didyouknowthat@dafne.rocks>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Pausch

pkgname=lbry-app-bin
pkgver=0.52.5
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
provides=('lbry' 'lbrynet')
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
source=("https://github.com/lbryio/lbry-desktop/releases/download/v$pkgver/LBRY_$pkgver.deb")
sha512sums=('276a00abc4582002eeac5a888dd2791cdda21524b6309c6d85b18709e5606a96b75eabc2bd96150b6f5037084fe6a310d84eeb20af4182fd71f4ac0bf1771a2c')

package() {
    install -dm 755 "$pkgdir/usr/bin/"
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
    ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
}
