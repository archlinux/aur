# Maintainer: Arthur Deierlein <arthur dot deierlein at adfinis dot com>

_pkgname=vault-gui
pkgname=$_pkgname-bin
pkgver="0.5.0"
pkgrel=1
pkgdesc="GUI for Hashicorps Vault"
arch=('x86_64')
url="https://github.com/adfinis/vault-gui"
license=('MIT')
depends=('openssl' 'webkit2gtk')
source=("https://github.com/adfinis/vault-gui/releases/download/v${pkgver}/vault-gui_${pkgver}_amd64.deb")
makedepends=('binutils' 'tar')
provides=("vault-gui=${pkgver}")
conflicts=('vault-gui-git')
sha256sums=('SKIP')

prepare() {
	ar p vault-gui_${pkgver}_amd64.deb data.tar.gz | tar zx
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
}
