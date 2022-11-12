# Maintainer: Kenneth Cremeans <iam@kcseb.digital>
# CoMaintainer: Tom Zander <tom@flowee.org>
# Release Code Name: Pausch
# LBRY, Why have you stopped the cool release code names?

pkgname=lbry-app-bin
pkgver=0.53.7
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
provides=('lbry' 'lbrynet')
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
source=("https://github.com/lbryio/lbry-desktop/releases/download/v$pkgver/LBRY_$pkgver.deb")
sha512sums=('fe41af66d8c95d8d834d1ef139a70238da2d698c37a3a429aad86fcff71301e8276522537f27d6f5d12d0cd6eb37fb9cf9ee59dfe5a4f228a00add7388b731d5')

package() {
    install -dm 755 "$pkgdir/usr/bin/"
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
    ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
}
