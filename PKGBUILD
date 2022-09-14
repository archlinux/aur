# Maintainer: Proton Technologies AG <opensource at proton dot me>
# Co-Maintainer: Alexandru Cheltutior <acrandom at pm dot me>
pkgname=python-protonvpn-nm-lib
_gitpkgname=protonvpn-nm-lib
pkgver=3.13.0
pkgrel=1
pkgdesc="Official ProtonVPN NetworkManager Library, maintained by the ProtonVPN team."
arch=("any")
url="https://github.com/ProtonVPN"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-client" "networkmanager" "networkmanager-openvpn" "openvpn" "libnm" "dbus" "libsecret" "python-pyxdg" "python-keyring" "python-jinja" "python-distro" "python-dbus" "python-systemd" "xdg-utils" "python-gobject")
conflicts=("protonvpn-cli<3.12.0" "protonvpn-gui<1.9.0")
makedepends=("python-setuptools")
source=("https://github.com/ProtonVPN/protonvpn-nm-lib/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('501d6bb8a31c6de28a36f966113e58dc1e78e6920a6a99a0b96e48229b1d9295')
validpgpkeys=("6A5571928D2222D83BC7456E4EDE055B645F044F")

build() {
    cd "$_gitpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitpkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
