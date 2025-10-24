# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Recolic K <root@recolic.net>

pkgname=microsoft-identity-broker-bin
_pkgname=microsoft-identity-broker
pkgver=2.0.3
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
source=("$url/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('be8acf7f9a6f34b001c27b620dd7c34a2b9b8358db1da28afe8d1f1646d9d34d')
install=${pkgname}.install

package() {
  cd "$srcdir"
  tar xvzf data.tar.gz
  cp -r "$srcdir/usr" "$pkgdir/"
}


