# Maintainer: Proton Technologies AG <opensource at proton dot me>
# Co-Maintainer: Alexandru Cheltutior <acrandom at pm dot me>
pkgname=python-protonvpn-nm-lib
_gitpkgname=protonvpn-nm-lib
pkgver=3.7.0
pkgrel=1
pkgdesc="Official ProtonVPN NetworkManager Library, maintained by the ProtonVPN team."
arch=("any")
url="https://github.com/ProtonVPN"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-client" "networkmanager" "networkmanager-openvpn" "openvpn" "libnm" "dbus" "libsecret" "python-pyxdg" "python-keyring" "python-jinja" "python-distro" "python-dbus" "python-systemd" "xdg-utils" "python-gobject")
conflicts=("protonvpn-cli<3.11.0" "protonvpn-cli<1.7.0")
makedepends=("python-setuptools")
source=("https://github.com/ProtonVPN/protonvpn-nm-lib/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('df556d4c3e8d22e39db9a1e6d78263fe591e31866f1f6a50dfd4be677b2f2576')
validpgpkeys=("A884 41BD 4864 F95B EE08  E63A 71EB 4740 1994 0E11")

build() {
    cd "$_gitpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitpkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
