# Maintainer: ravi0li <mail+aur at moritz dot pw>
pkgname=pomatez
pkgver=1.4.2
pkgrel=1
pkgdesc="Stay Focused. Take a Break."
arch=('x86_64')
url="https://zidoro.github.io/pomatez/"
license=('MIT')
makedepends=('tar')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/zidoro/pomatez/releases/download/v${pkgver}/Pomatez-v${pkgver}-linux-amd64.deb")
sha512sums=('1af619697ba1a3078c2eb13245623ed08a1e10b4bc8d9b122d7d4227052eca9e8e2597845887415fbdafe4a72b569b921f3b6ac25d36571ec0628b917d16478a')

package() {
	cd "${pkgdir}"
	mkdir -p usr/bin
	ln -s /opt/Pomatez/pomatez usr/bin/pomatez
	# extracts everything into the pkgdir
	tar xf "${srcdir}/data.tar.xz"
}
