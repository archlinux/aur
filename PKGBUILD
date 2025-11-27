# Maintainer: Robert Olejnik <robert [/.at./] teonite.com>
pkgname=defguard-client
pkgsrc=defguard-client
pkgver=1.5.2
pkgrel=6
pkgdesc="Defguard VPN Multi-Factor Authentication Desktop Client"
arch=('x86_64')
url="https://github.com/DefGuard/client"
license=('custom')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator'  'libsoup'  'pango'  'webkit2gtk-4.1' 'systemd-resolvconf')
source_x86_64=(https://github.com/DefGuard/client/releases/download/v${pkgver}/defguard-client_${pkgver}_amd64.deb)
# Update to actual SHA sum of package
sha256sums_x86_64=('7d9bc8974e6d9f0946167267cd9f84589b9766a706d50a77777fdfe013011269')
install=defguard-client.install

package() {
    msg2 "Extracting the source debian package data.tar.xz..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"
    mv $pkgdir/usr/sbin/defguard-service $pkgdir/usr/bin/
    rmdir $pkgdir/usr/sbin
}

