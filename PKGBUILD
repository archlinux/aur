# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Recolic K <root@recolic.net>

pkgname=microsoft-identity-broker-bin
_pkgname=microsoft-identity-broker
pkgver=2.0.2
pkgrel=2
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
        'glibc'
        'gtk3'
        'harfbuzz'
        'hicolor-icon-theme'
        'libsecret'
        'libsoup3'
        'libx11'
        'openssl'
        'pango'
        'systemd'
        'webkit2gtk-4.1'
)
provides=("msft-identity-broker=${pkgver}" "${_pkgname}")
conflicts=("msft-identity-broker" "${_pkgname}")
replaces=("msft-identity-broker" "${_pkgname}")
source=("$url/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('b7cc769b9fbc9e09ce8f92f793e2bf3c3c4f3fa18083adecdf089938be76e1d0')
install=${pkgname}.install

package() {
  cd "$srcdir"
  tar xvzf data.tar.gz
  cp -r "$srcdir/usr" "$pkgdir/"
}


