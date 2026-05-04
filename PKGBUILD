# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Recolic K <root@recolic.net>
# Contributor: Christian Nicola <dev at chrisnicola dot de>

pkgname=microsoft-identity-broker-bin
_pkgname=microsoft-identity-broker
pkgver=3.0.2
pkgrel=1
pkgdesc="Broker for authentication between device and Microsoft Intune"
url="https://packages.microsoft.com/ubuntu/24.04/prod/pool/main/m/${_pkgname}"
license=("Unknown")
arch=('x86_64')
depends=(
        'at-spi2-core'
        'cairo'
        'curl'
        'dbus'
        'gdk-pixbuf2'
        'glib2'
        'glibc'
        'gtk3'
        'harfbuzz'
        'hicolor-icon-theme'
        'libp11-kit'
        'libsecret'
        'libsoup3'
        'libx11'
        'openssl'
        'pango'
        'systemd'
        'webkit2gtk-4.1'
        'zlib'
)
provides=("msft-identity-broker=${pkgver}" "${_pkgname}")
conflicts=("msft-identity-broker" "${_pkgname}")
replaces=("msft-identity-broker" "${_pkgname}")
source=("$url/${_pkgname}_${pkgver}-noble_amd64.deb")
sha256sums=('03e60d7db7197e5903965c5df7b601ae1bdb72fce986ccfbcdbef2fda6f2c7f9')
install=${pkgname}.install

package() {
  tar xvzf "$srcdir/data.tar.gz" -C"$pkgdir"
  chmod -R 755 "$pkgdir"
}
