# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=mrpack-install
pkgname="$_pkgbase-bin"
pkgver=0.21.0.beta
pkgrel=1
pkgdesc="Modrinth Modpack server deployment"
arch=('x86_64' 'aarch64')
url="https://github.com/nothub/mrpack-install"
license=('MIT')
provides=('mrpack-install')
conflicts=('mrpack-install')
_version="${pkgver/\.beta/-beta}"
source_x86_64=("$_pkgbase::https://github.com/nothub/mrpack-install/releases/download/v${_version}/mrpack-install_${_version}_linux_amd64.tar.gz")
source_aarch64=("$_pkgbase::https://github.com/nothub/mrpack-install/releases/download/v${_version}/mrpack-install_${_version}_linux_arm64.tar.gz")
sha256sums_x86_64=('38b016bbbe0699f22917837e238db21e6a340dcec388a6b6239c4c15daabde0f')
sha256sums_aarch64=('38b016bbbe0699f22917837e238db21e6a340dcec388a6b6239c4c15daabde0f')

package() {
	install -Dm755 mrpack-install "$pkgdir"/usr/bin/mrpack-install
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/"$_pkgbase"/LICENSE.txt
}
