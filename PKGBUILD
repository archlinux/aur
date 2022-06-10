# Maintainer: Kenneth Cremeans <iam@kcseb.digital>
# CoMaintainer: Tom Zander <tom@flowee.org>
# Release Code Name: Pausch
# LBRY, Why have you stopped the cool release code names? 

pkgname=lbry-app-bin
pkgver=0.53.4
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
provides=('lbry' 'lbrynet')
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
source=("https://github.com/lbryio/lbry-desktop/releases/download/v$pkgver/LBRY_$pkgver.deb")
sha512sums=('e4489d05ff3ad1c62ef3b8927527940c77128a2ba7e5d7c78ca52eff252a790b32feb999a44faf3730ce54543e12a8aae5ca67660036a256558e25b91d2bcd82')

package() {
    install -dm 755 "$pkgdir/usr/bin/"
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
    ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
}
