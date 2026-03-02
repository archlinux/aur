pkgname=lucent-bin
_pkgname=lucent
pkgver=1.0.1
pkgrel=1
pkgdesc="A blazing-fast, D-Bus activated Wayland notification daemon (Pre-compiled)"
arch=('x86_64')
url="https://github.com/CPT-Dawn/Lucent"
license=('MIT')
depends=('glib2' 'gtk4' 'gtk4-layer-shell' 'dbus')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64.tar.gz")
sha256sums=('3b48e297fab78557228cfe845a64d3731bfd4c664a74658bb8eb152a8a78df65') 

package() {
  # Install the binary
  install -Dm755 "${srcdir}/lucent" "${pkgdir}/usr/bin/lucent"

  # Install the D-Bus activation file
  install -Dm644 \
    "${srcdir}/org.freedesktop.Notifications.service" \
    "${pkgdir}/usr/share/dbus-1/services/org.freedesktop.Notifications.service"
}