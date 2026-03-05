# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR package: rosec-provider-gnome-keyring-bin
#
# This PKGBUILD installs the pre-built GNOME Keyring WASM provider for
# rosec from the GitHub release.
# The release workflow renders this file by substituting 0.0.9 and
# d35c2788018b14758974c7defb24a22bebfc92725e66ac82479eee092b3108df before committing to the AUR.
#
# To build manually, replace the placeholders and run makepkg -si.

pkgname=rosec-provider-gnome-keyring-bin
pkgver=0.0.9
pkgrel=1
pkgdesc="GNOME Keyring read-only provider for rosec (prebuilt)"
arch=('any')
url="https://github.com/jmylchreest/rosec"
license=('MIT')
depends=(
    'rosec'
)
provides=('rosec-provider-gnome-keyring')
conflicts=('rosec-provider-gnome-keyring')

source=(
    "rosec-provider-gnome-keyring-${pkgver}.wasm.tar.gz::https://github.com/jmylchreest/rosec/releases/download/v${pkgver}/rosec-provider-gnome-keyring-${pkgver}.wasm.tar.gz"
)
sha256sums=('d35c2788018b14758974c7defb24a22bebfc92725e66ac82479eee092b3108df')

package() {
    install -Dm644 "${srcdir}/rosec_gnome_keyring.wasm" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_gnome_keyring.wasm"
    install -Dm644 "${srcdir}/rosec_gnome_keyring.wasm.minisig" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_gnome_keyring.wasm.minisig"
}
