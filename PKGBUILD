# Maintainer: Alois <aloisianer@proton.me>
pkgname=tensamin-bin
_pkgname=tensamin
pkgver=0.1.3
pkgrel=1
pkgdesc="True E2EE, decentralized messages. Open source and privacy first."
arch=('x86_64')
url="https://tensamin.net"
license=('custom')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libappindicator-gtk3' 'libsecret')
provides=('tensamin')
conflicts=('tensamin' 'tensamin-git')
source=("https://github.com/Tensamin/Frontend/releases/download/v${pkgver}/tensamin_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
	cd "$srcdir"
	ar x "${_pkgname}_${pkgver}_amd64.deb"
	tar --zstd -xf data.tar.zst -C "${pkgdir}"
}
