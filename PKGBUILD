# Maintainer: Kenneth Cremeans <iam@kcseb.digital>
# CoMaintainer: Tom Zander <tom@flowee.org>
# Release Code Name: Pausch
# LBRY, Why have you stopped the cool release code names?

pkgname=lbry-app-bin
pkgver=0.53.6
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
provides=('lbry' 'lbrynet')
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
source=("https://github.com/lbryio/lbry-desktop/releases/download/v$pkgver/LBRY_$pkgver.deb")
sha512sums=('7c2861dc68e8dcacce0c17b1588d6ce17f5535367c860e28ca2a27104423cbb93aa978c22f6b07be7107ebebd6e99441c343d03c41a61d6e7763894d4cc08da9')

package() {
    install -dm 755 "$pkgdir/usr/bin/"
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
    ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
}
