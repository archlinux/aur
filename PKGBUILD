# Maintainer: Proton Technologies AG <opensource at proton dot me>
# Co-Maintainer: Alexandru Cheltutior <acrandom at pm dot me>
pkgname=python-protonvpn-nm-lib
_gitpkgname=protonvpn-nm-lib
pkgver=3.4.1
pkgrel=3
pkgdesc="Official ProtonVPN NetworkManager Library, maintained by the ProtonVPN team."
arch=("any")
url="https://github.com/ProtonVPN"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-client" "networkmanager" "networkmanager-openvpn" "openvpn" "libnm" "dbus" "libsecret" "python-pyxdg" "python-keyring" "python-jinja" "python-distro" "python-dbus" "python-systemd" "xdg-utils" "python-gobject")
conflicts=("protonvpn-cli<3.9.0" "protonvpn-gui<1.3.0")
makedepends=("python-setuptools")
source=("https://github.com/ProtonVPN/protonvpn-nm-lib/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0d4de823c3a22ea8f555ab64823bc59701699934c445a729987afd0989585f8a')
validpgpkeys=("A884 41BD 4864 F95B EE08  E63A 71EB 4740 1994 0E11")

build() {
    cd "$_gitpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitpkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
