# Maintainer: ravi0li <mail+aur at moritz dot pw>
pkgname=pomatez
pkgver=1.6.0
pkgrel=1
pkgdesc="Stay Focused. Take a Break."
arch=('x86_64')
url="https://zidoro.github.io/pomatez/"
license=('MIT')
makedepends=('tar')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/zidoro/pomatez/releases/download/v${pkgver}/Pomatez-v${pkgver}-linux-amd64.deb")
sha512sums=('de3778e0fcd4e3dc06e8d88576659d184d2a85cdc50cdecc5191a5115477949cbefb5bf15d1b5622db70e6a511de5ec414034e1f1f1aa5a8a91fca949fe66368')

package() {
	cd "${pkgdir}"
	mkdir -p usr/bin
	ln -s /opt/Pomatez/pomatez usr/bin/pomatez
	# extracts everything into the pkgdir
	tar xf "${srcdir}/data.tar.xz"
}
