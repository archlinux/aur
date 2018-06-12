# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Ashwin Vishnu <ashuwish+arch at gmail dot com>

pkgname=sendanywhere
pkgver=8.5.28
pkgrel=3
pkgdesc="Send Anywhere is a multi-platform file sharing service where users can directly share digital content in real time."
arch=('x86_64')
url="http://send-anywhere.com"
license=('custom:sendanywhere_eula')
options=('!strip' '!emptydirs')
depends=('nss' 'libxtst' 'libxss' 'gconf' 'gtk2' 'alsa-lib')
source=("${pkgname}-${pkgver}.deb::https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb")
sha512sums=('f1e7af787bf936f2ec6e385de4ba2ce160a2199ea5d66f5a9fb8cc955a37084bbb9e744ff2cbe60739e87587275b5e5a3bdd3685c6e75e848cf245f89646eb1a')

package(){
    tar xf data.tar.xz -C "$pkgdir"

    install -Dm644 "$pkgdir/opt/SendAnywhere/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 "$pkgdir/opt/SendAnywhere/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
