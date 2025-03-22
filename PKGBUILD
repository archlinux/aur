# Maintainer: buzz <buzz@users.noreply.github.com>
pkgname=volctl
pkgver=0.9.5
pkgrel=1
pkgdesc="Per-application volume control and OSD for Linux desktops."
arch=("any")
url="https://buzz.github.io/volctl/"
license=("GPL")
depends=("python" "python-gobject" "python-cairo" "pulse-native-provider" "desktop-file-utils" "python-pulsectl")
optdepends=("pavucontrol: mixer support", "statusnotifier-introspection-dbus-menu: SNI support")
makedepends=("python-build" "python-installer" "python-setuptools")
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/buzz/volctl/archive/v${pkgver}.tar.gz")
b2sums=("a5ba6aa2c31fc344fbf8a77079b53149cea78257204d37ccb9a5aea1df7849e2e423fafb8def906d9e0e37835a062a31cea78aaf5e0a1005bea68e253094ac41")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
