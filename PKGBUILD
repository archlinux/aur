# Maintainer: fecet <xiezej@gmail.com>
pkgname=nix-installer-bin
_pkgname=nix-installer
pkgver=3.20.0
pkgrel=1
pkgdesc="Determinate Nix Installer (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/DeterminateSystems/nix-installer"
license=('LGPL-2.1-only')
provides=("nix-installer=${pkgver}")
conflicts=('nix-installer')
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/nix-installer-x86_64-linux")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/nix-installer-aarch64-linux")
sha256sums_x86_64=('afaf0c1f426a08967aef4c7f50bbb6282a9312f945775bdf0a0110642339d9d6')
sha256sums_aarch64=('86fadffa29c5362e16f9f8f2534603846da851ed00af103d3dbebeb30771b8b7')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
}
