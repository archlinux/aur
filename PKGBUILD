# Maintainer: ravi0li <mail+aur at moritz dot pw>
pkgname=pomatez
pkgver=1.3.1
pkgrel=1
pkgdesc="Stay Focused. Take a Break."
arch=('x86_64')
url="https://zidoro.github.io/pomatez/"
license=('MIT')
makedepends=('tar')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/zidoro/pomatez/releases/download/v${pkgver}/Pomatez-v${pkgver}-linux-amd64.deb")
sha512sums=('81dc8a92c69cfd9f685ced51b3e66c168de9e94d6c0842b0a291e4d3e141e169761c90df82848ffd95c4e557cfffc360ea898c2229644fb20cc31a8386b898e1')

package() {
	cd "${pkgdir}"
	mkdir -p usr/bin
	ln -s /opt/Pomatez/pomatez usr/bin/pomatez
	# extracts everything into the pkgdir
	tar xf "${srcdir}/data.tar.xz"
}
