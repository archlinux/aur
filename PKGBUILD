# Maintainer: Frédéric Logier <fredix@protonmail.com>
_name=harbor
_tag=1.0.0
pkgname=harbor
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Ecash management tool"
arch=('x86_64')
url="https://github.com/HarborWallet/harbor"
license=('MIT')
groups=()
makedepends=()
checkdepends=()
optdepends=()
provides=("${_name}")
conflicts=("${_name}")
replaces=()
backup=()
options=('!lto')
install=
changelog=
source=("${url}/releases/download/v${_tag}/harbor-ui-${_tag}-amd64-linux.tar.gz")

noextract=()
sha256sums=("SKIP")
validpgpkeys=()

package() {
	cd "$srcdir/"
        install -Dm755 --no-target-directory "harbor" "${pkgdir}/usr/bin/${_name}"
        install -Dm755 --no-target-directory bin/harbor-ui "${pkgdir}/usr/bin/${_name}-ui"
        install -Dm644 share/applications/cash.harbor.harbor.desktop "${pkgdir}/usr/share/applications/cash.harbor.harbor.desktop"
	install -d "${pkgdir}/usr/share/icons"
        install -Dm644 share/icons/* "${pkgdir}/usr/share/icons"
        install -Dm644 share/metainfo/cash.harbor.harbor.appdata.xml "${pkgdir}/usr/share/metainfo/cash.harbor.harbor.appdata.xml"
}
