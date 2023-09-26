# Maintainer: ravi0li <mail+aur at moritz dot pw>
pkgname=pomatez
pkgver=1.3.0
pkgrel=1
pkgdesc="Stay Focused. Take a Break."
arch=('x86_64')
url="https://roldanjr.github.io/pomatez/"
license=('MIT')
makedepends=('tar')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/roldanjr/pomatez/releases/download/v${pkgver}/Pomatez-v${pkgver}-linux-amd64.deb")
sha512sums=('5a5e06793aeb50eeb7747c57d9ddf212b07bf1adea86624a0a98eeb61cb69f5fcdca773e8fd4fc217c0a847e30b55ecf750406dc3df0bb5de7abcd9b92801774')

package() {
	cd "${pkgdir}"
	mkdir -p usr/bin
	ln -s /opt/Pomatez/pomatez usr/bin/pomatez
	# extracts everything into the pkgdir
	tar xf "${srcdir}/data.tar.xz"
}
