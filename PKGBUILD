# Maintainer: Kenneth Cremeans <iam@kcseb.digital>
# CoMaintainer: Tom Zander <tom@flowee.org>
# Release Code Name: Pausch
# LBRY, Why have you stopped the cool release code names? 

pkgname=lbry-app-bin
pkgver=0.53.2
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
provides=('lbry' 'lbrynet')
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
source=("https://github.com/lbryio/lbry-desktop/releases/download/v$pkgver/LBRY_$pkgver.deb")
sha512sums=('5530ef6998aee2abfcc8d2cfad1edfd38b6b93ba736a42345a19a29e7d9983e1d7cc6bb7da7de8992e1fa29f457249cf8aa19f758ff01376b59acb7c49e1baf4')

package() {
    install -dm 755 "$pkgdir/usr/bin/"
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
    ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
}
