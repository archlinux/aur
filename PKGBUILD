# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Recolic K <root@recolic.net>

pkgname=microsoft-identity-broker-bin
_pkgname=microsoft-identity-broker
pkgver=2.0.2
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
sha256sums=('6b2d1673f0cdea1f71ca8e5f1e8b5725c67569a5e4477f21bfd52f96e313031f')
install=${pkgname}.install

package() {
  cd "$srcdir"
  tar xvzf data.tar.gz
  cp -r "$srcdir/usr" "$pkgdir/"
}


