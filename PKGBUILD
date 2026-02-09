# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=mrpack-install
pkgname="$_pkgbase-bin"
pkgver=0.21.0.beta
pkgrel=2
pkgdesc="Modrinth Modpack server deployment"
arch=('x86_64' 'aarch64')
url="https://github.com/nothub/mrpack-install"
license=('MIT')
provides=('mrpack-install')
conflicts=('mrpack-install')
_version="${pkgver/\.beta/-beta}"
source_x86_64=("$_pkgbase::https://github.com/nothub/mrpack-install/releases/download/v${_version}/mrpack-install_${_version}_linux_amd64.tar.gz")
source_aarch64=("$_pkgbase::https://github.com/nothub/mrpack-install/releases/download/v${_version}/mrpack-install_${_version}_linux_arm64.tar.gz")
sha256sums_x86_64=('718e2f9f7337cddd8992641b22e704786a5e70e744e661d51aa3494f7ddfd9d2')
sha256sums_aarch64=('cc4412ac6086ef9c902dc5d86c90f0a2704582eeb370724aba586cb75d10b58f')

package() {
	install -Dm755 mrpack-install "$pkgdir"/usr/bin/mrpack-install
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/"$_pkgbase"/LICENSE.txt
}
