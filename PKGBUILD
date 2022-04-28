# Maintainer: Kenneth Cremeans <iam@kcseb.digital>
# CoMaintainer: Tom Zander <tom@flowee.org>
# Release Code Name: Pausch
# LBRY, Why have you stopped the cool release code names? 

pkgname=lbry-app-bin
pkgver=0.53.3
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
provides=('lbry' 'lbrynet')
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
source=("https://github.com/lbryio/lbry-desktop/releases/download/v$pkgver/LBRY_$pkgver.deb")
sha512sums=('b5319dbe312ebc80bdf3db1659a64a4cc780ab43df034c978328844ff0beefe36f284243c9194a6b552fe0d0fc8f9ff6c06d633f73fc69fa8ad46735b7cd27c8')

package() {
    install -dm 755 "$pkgdir/usr/bin/"
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
    ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
}
