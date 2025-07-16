# Maintainer: Freedom Dumlao <freedom@hey.com>

pkgname=zscaler-deps
pkgver=0.1.0
pkgrel=1
pkgdesc="Dependencies and compatibility fixes for ZScaler Client Connector on Arch Linux (does not include ZScaler itself) - Tested with ZScaler 3.7.2"
arch=('x86_64')
url="https://github.com/apiguy/zscaler-deps"
license=('MIT')
depends=(
    'glib2'
    'net-tools'
    'dbus'
    'qt5-base'
    'qt5-webengine'
    'qt5-webkit'
    'dbus-glib'
    'nss'
    'libpcap'
    'curl'
    'jq'
    'gpgme'
    'openssl'
)
install=zscaler-deps.install

package() {
    # Create directory for symlinks
    install -dm755 "$pkgdir/usr/lib"
    
    # Create compatibility symlinks for Debian/Ubuntu library versions
    # These will point to the Arch equivalents
    ln -sf /usr/lib/libgpgme.so "$pkgdir/usr/lib/libgpgme.so.11"
    
    # Note: Additional symlinks may be needed depending on your ZScaler version
    # Common ones include:
    # ln -sf /usr/lib/libssl.so "$pkgdir/usr/lib/libssl.so.1.1"
    # ln -sf /usr/lib/libcrypto.so "$pkgdir/usr/lib/libcrypto.so.1.1"
}