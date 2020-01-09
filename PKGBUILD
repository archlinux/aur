# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher-cli-bin
_pkgname=etcher-cli
pkgver=1.4.9
pkgrel=2
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('x86_64')
url="http://www.etcher.io/"
_github_url="https://github.com/balena-io/etcher/releases/download/v${pkgver}"
license=('Apache')
provides=('etcher-cli')
conflicts=('etcher-cli' 'etcher-cli-git')
depends=('gcc-libs')
optdepends=()
source=("https://github.com/balena-io/etcher/releases/download/v${pkgver}/balena-etcher-cli-${pkgver}-linux-x64.tar.gz")
options=("!strip")
sha256sums=('67d1173fdf7c4c528f4027147463597cffdef9d50ddcf0c74c9651685b1c451e')

package() {
    mkdir -p "${pkgdir}/opt"
    mv "${srcdir}/balena-${_pkgname}-${pkgver}-linux-x64-dist" "${pkgdir}/opt/${_pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    ln -snf "../../opt/${_pkgname}/balena-etcher" "etcher-cli"
}
