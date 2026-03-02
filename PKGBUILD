# Maintainer: Robert Olejnik <robert [/.at./] teonite.com>
pkgname=defguard-client
pkgsrc=defguard-client
pkgver=1.6.6
pkgrel=6
pkgdesc="Defguard VPN Multi-Factor Authentication Desktop Client"
arch=('x86_64')
url="https://github.com/DefGuard/client"
license=('custom')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator'  'libsoup'  'pango'  'webkit2gtk-4.1' 'systemd-resolvconf')
source_x86_64=(https://github.com/DefGuard/client/releases/download/v${pkgver}/defguard-client_${pkgver}_amd64.deb)
# Update to actual SHA sum of package
sha256sums_x86_64=('24613581180e0f46086c1dafd068f426c34ddfc496f9aa97ab650728ea0e4de4')
install=defguard-client.install

package() {
    msg2 "Extracting the source debian package data.tar.xz..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"
    mv $pkgdir/usr/sbin/defguard-service $pkgdir/usr/bin/
    rmdir $pkgdir/usr/sbin
}

