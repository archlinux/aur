# Maintainer: M0Rf30
# Contributor: Sebastian Jug <seb AT stianj DOT ug>

pkgname=openbazaar-bin
pkgver=1.1.13
pkgrel=1
pkgdesc="OpenBazaar Client, Decentralized Peer to Peer Marketplace for Bitcoin -- Static binaries"
arch=('i686' 'x86_64')
url="https://github.com/OpenBazaar/OpenBazaar-Client"
license=('MIT')
depends=('gconf' 'glibc' 'libcap' 'gtk2' 'libgcrypt' 'libnotify' 'nss' 'libxtst' 'python' 'xdg-utils' 'desktop-file-utils' 'nodejs')
optdepends=('gvfs' 'lsb-release' 'gnome-keyring' 'libgnome-keyring')
conflicts=('openbazaar')
install="$pkgname.install"
source_i686=("https://github.com/OpenBazaar/OpenBazaar-Installer/releases/download/v${pkgver}/openbazaar_${pkgver}_i386.deb")
source_x86_64=("https://github.com/OpenBazaar/OpenBazaar-Installer/releases/download/v${pkgver}/openbazaar_${pkgver}_amd64.deb")

package() {
    msg2 "Extracting the data.tar.xz..."
    tar -xf data.tar.xz -C "${pkgdir}/"

    msg2 "Cleaning up..."
    rm -r "$pkgdir"/usr/share/lintian/

    msg2 "Fixing permissions..."
    chmod -R 755 "$pkgdir"/usr/

    msg2 "Installing licenses..."
    install -Dm644 "$pkgdir/usr/share/openbazaar/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgdir/usr/share/openbazaar/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}

sha256sums_i686=('87c73589aebdb78455e69fe1ccc058440d0ae662404e9ef7d4988e6c574e2add')
sha256sums_x86_64=('34118eecedd15d89052b8cc6d08fb789adba5788d43019ea5c89e52f1f07064a')
